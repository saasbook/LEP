import csv

class Student:
  def __init__(self, fields):
    self.fields = fields # hash table of user fields

students = [] # a list of dicts that describe a student
language_prof = {"elementary": 1, "limited": 2, "intermediate": 3, "nearly_proficient": 4}

def lookup(proficiency):
  return language_prof[proficiency]

# setup function to read the user csv
# and initialize hash table of student objects
def setup():
  with open("script/newsheet.csv", "r") as users:
    reader = csv.DictReader(users)
    for row in reader:
      fields = {
          'name': row['first_name'] + row['last_name'], 
          'gender': row['gender'], 
          'academic_title': row['academic_title'],
          'residency': row['residency'],
          'gender_preference': row['gender_preference'],
          'fluent_languages': row['fluent_languages'], 
          'lang_additional_info': row['lang_additional_info'],
          'first_lang_preference': row['first_lang_preference'],
          'first_lang_proficiency': lookup(row['first_lang_proficiency']),
          'second_lang_preference': row['second_lang_preference'],
          'second_lang_proficiency': lookup(row['second_lang_proficiency']),
          'time_preference': row['time_preference'],
          'hours_per_week': row['hours_per_week'],
          'id': row['id']
          'sid': row['sid']
      }
      s = Student(fields)
      students.append(extract_student_info(s))
    users.close()

# a score is a tuple of (gender, gender_preference)
def gender_score(score1, score2):
  if score1[1] == "Indifferent" and score2[1] == 'Indifferent':
    return 1
  if score1[1] == score2[0] and score2[1] == score1[0]:
    return 3
  if (score1[1] == score2[0] and score2[1] == 'Indifferent') or (score1[0] == score2[1] and score1[1] == 'Indifferent'):
    return 2
  else:
    return 0

# languages = list of tuples: (language_preference, language_proficiency)
def data_clean(languages):
  cleaned = []
  ls = []
  for (l, p) in languages:
    if type(l) == list:
      for i in xrange(len(l)):
        if l[i] != '' and l[i] not in ls:
          cleaned.append((l[i], p[i]))
          ls.append(l[i])
    else:
      if l != '' and l not in ls:
        if p !='':
          cleaned.append((l, p))
          ls.append(l)
  return cleaned

# def get_profi(student):
#   na = student[9].split(",")
#   sn = []
#   for nai in na:
#     sni = 5
#     if nai == student[14]:
#       if student[15] != '':
#         sni = student[15]
#     elif nai == student[16]:
#       if student[17] != '':
#         sni = student[17]
#     sn.append(sni)
#   return sn

def mutual_interest(sn, si, pn, pi):
  total = 0
  st, pt = False, False
  for (sl, spro) in sn:
    for (pl, ppro) in pi:
      if sl == pl:
        st = True
        total -= abs(spro-ppro)*0.25
  for (pl, ppro) in pn:
    for (sl, spro) in si:
      if sl == pl:
        pt = True
        total -= abs(spro-ppro)*0.25
  if st and pt:
    total+=15
    return (True, total)
  return (False, 0)

def same_interest(si, pi):
  total = 0
  languages = []
  for (sl, sp) in si:
    for (pl, pp) in pi:
      if sl == pl:
        languages.append(sl)
        total += 5 - abs(sp-pp)*0.5
  return total

def one_interest(sn, si, pn, pi):
  total = 0
  for (s1_lang, s1_proficiency) in sn:
    for (s2_lang, s2_proficiency) in pi:
      if s1_lang == s2_lang:
        total += 3 - abs(s1_proficiency-s2_proficiency)*0.5
  for (s2_lang, s2_proficiency) in pn:
    for (s1_lang, s1_proficiency) in si:
      if s1_lang == s2_lang:
        total += 3 - abs(s1_proficiency-s2_proficiency)*0.5
  return total

def language_score(student, potential):
  final = 0
  sn, si = student
  pn, pi = potential
  if sn[0] != pn[0]:
    final += 1
  mi, mi_score = mutual_interest(sn, si, pn, pi)
  si_score = same_interest(si, pi)
  if not mi:
    final += one_interest(sn, si, pn, pi)
  final += mi_score + si_score
  return final

# assumes each day...fck this method.
def time_score(s1_time, s2_time, s1_hour, s2_hour):
  total = 0.0
  for s1_day in s1_time:
    for s2_day in s2_time:
      if s1_day == s2_day:
        total += 1
  if s1_hour == s2_hour:
    total += 0.5
  return total 

def meetup(s1_time, s2_time):
  meetup_time = ''
  week = {0:"Monday: ", 1:"Tuesday: ", 2:"Wednesday: ", 3:"Thursday: ", 4:"Friday: "}
  for s1_day in s1_time:
    for s2_day in s2_time:
      if s1_day == s2_day:
        #if check:
        meetup_time += s1_day + ", "
  return meetup_time[:len(meetup_time)-1]

def language_detection(best_pair):
  s1, s2 = best_pair
  sn1, si1 = s1
  sn2, si2 = s2
  languages = ''
  visited = []
  for (l1, p1) in sn1:
    for (l2, p2) in si2:
      if l1 == l2 and l1 not in visited:
        languages+=l1+"("+language_prof[min(p1, p2)]+"), "
        visited.append(l1)
  for (l1, p1) in si1:
    for (l2, p2) in sn2:
      if l1 == l2 and l1 not in visited:
        languages+=l1+"("+language_prof[min(p1, p2)]+"), "
        visited.append(l1)
  for (l1, p1) in si1:
    for (l2, p2) in si2:
      if l1 == l2 and l1 not in visited:
        languages+=l1+"("+language_prof[min(p1, p2)]+"), "
        visited.append(l1)
  languages = languages[:(len(languages)-2)]
  return languages

def extract_student_info(student):
  info = {}
  info['id'] = student.fields['id']
  info['name'] = student.fields['name']
  info['sid'] = student.fields['sid']
  info['academic'] = student.fields['academic_title']
  info['residency'] = student.fields['residency']
  info['gender'] = (student.fields['gender'], student.fields['gender_preference'])
  info['lang_to_teach'] = [(x, 4) for x in student.fields['fluent_languages'].split(",")]
  info['lang_to_learn'] = data_clean([(student.fields['first_lang_preference'], student.fields['first_lang_proficiency']),
              (student.fields['second_lang_preference'], student.fields['second_lang_proficiency'])])
  info['time'] = student.fields['time_preference']
  info['hour'] = student.fields['hours_per_week']
  return info

def calculate_match_score(student1, student2):
  score = 0.0
  # Add in the score for residency
  # It is more preferable to match domestic with international students
  if student1['residency'] != student2['residency']:
    score += 0.5
  # Take into account gender preferences
  score += gender_score(student1['gender'], student2['gender'])
  # Take into account time and hour preferences
  score += time_score(student1['time'], student2['time'], student1['hour'], student2['hour'])
  score += abs(int(student1['hour'])+int(student2['hour']))*0.5 - abs(int(student1['hour'])-int(student2['hour']))*0.5
  # Take into account language matchings
  # This is the most important thing to consider and should be weighted accordingly
  score += language_score((student1['lang_to_teach'], student1['lang_to_learn']), (student2['lang_to_teach'], student2['lang_to_learn']))
  return score

setup()
pairs = open('script/final_pairs.csv', 'w')
fields = ['partner1', 'partner2', 'language(s)', 'possible meetup time', 'stability']
writer = csv.DictWriter(pairs, fieldnames=fields)
writer.writeheader()

# attempt to pair every student with another student
while len(students) != 0:
  print(len(students))
  if len(students) == 1:
    student = students.keys()[0]
    pairs.writerow({'partner1': student.fields['name']})
    students.remove(student)
    break
  final = 0.0

  # Find the best match amoung all of the students
  for student1 in students:
    highest = 0.0
    for student2 in students:
      if student2 != student1:
        score = calculate_match_score(student1, student2)
        if highest < score:
          highest = score
          best = student2
          best_language = (student2['lang_to_teach'], student2['lang_to_learn'])

    if final < highest:
      final = highest
      best_pair = (student1, best)
      best_language = ((student1['lang_to_teach'], student1['lang_to_learn']), best_language)

    partner1 = best_pair[0]
    partner2 = best_pair[1]
    language = language_detection(best_language)
    meetup_days = meetup(partner1['time'], partner2['time'])

    writer.writerow({'partner1': partner1['id'], 'partner2': partner2['id'], 'language(s)': language, 'possible meetup time': meetup_days, 'stability': str(final)})
    students.remove(partner1)
    students.remove(partner2)

#need to check if the student put the right ID number
