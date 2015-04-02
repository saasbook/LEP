import csv

class Student:
  def __init__(self, fields):
    self.fields = fields # hash table of user fields

students = []
pairs = []
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
          'sid': row['sid']
      }
      s = Student(fields)
      students.append(s)

    users.close()

'''
for line in users:
    newline = line.split(",")
    students.append(newline)
    for word in range(len(newline)):
        if newline[word] == "Elementary proficiency":
            newline[word] = 1
        elif newline[word] == "Limited proficiency":
            newline[word] = 2
        elif newline[word] == "Intermediate proficiency":
            newline[word] = 3
        elif newline[word] == "Nearly-full professional proficiency":
            newline[word] = 4
'''         

# a score is a tuple of (gender, gender_preference)
def gender_score(score1, score2):
  if score1[1] == "Indifferent" and score2[1] == 'Indifferent':
    return 1
  if score1[1] == score2[0] and score2[1] == score1[0]:
    return 5
  if (score1[1] == score2[0] and score2[1] == 'Indifferent') or (score1[0] == score2[1] and score1[1] == 'Indifferent'):
    return 3
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

def get_profi(student):
    na = student[9].split(",")
    sn = []
    for nai in na:
        sni = 5
        if nai == student[14]:
            if student[15] != '':
                sni = student[15]
        elif nai == student[16]:
            if student[17] != '':
                sni = student[17]
        sn.append(sni)
    return sn

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
  t = ''
  week = {0:"Monday: ", 1:"Tuesday: ", 2:"Wednesday: ", 3:"Thursday: ", 4:"Friday: "}
  #for i in xrange(5):
  #print 's1_time: ', s1_time
  check = True
  for s1_day in s1_time:
    #print 's1_time, again: ', s1_day
    for s2_day in s2_time:
      if s1_day == s2_day:
        if check:
          t += s1_day
          check = False
        else:
          t += ", " + s1_day
  return t

def language_detection(best_pair):
    s1, s2 = best_pair
    print "s1:", s1
    print "s2:", s2
    sn1, si1 = s1[0]
    sn2, si2 = s2[0]
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

setup()
pairs = open('script/final_pairs.csv', 'w')
fields = ['partner1', 'partner2', 'language(s)', 'possible meetup time', 'stability']
writer = csv.DictWriter(pairs, fieldnames=fields)
writer.writeheader()
#pairs.write("partner1\tpartner2\tlanguage(s)\tPossible Meetup time\tstability\n")

# attempt to pair every student with another student
while len(students) != 0:
    print(len(students))
    if len(students) == 1:
        student = students.keys()[0]
        pairs.writerow({'partner1': student.fields['name']})
        students.remove(student)
        break
    final = 0.0
    for student1 in students:
        s1_academic = student1.fields['academic_title']
        s1_residency = student1.fields['residency']
        s1_gender = (student1.fields['gender'], student1.fields['gender_preference'])
        fluent_lang = student1.fields['fluent_languages'].split(',')
        s1_lang_to_teach = []
        for lang in fluent_lang:
          s1_lang_to_teach.append((lang, 4))
        s1_lang_to_learn = data_clean([(student1.fields['first_lang_preference'], student1.fields['first_lang_proficiency']),
              (student1.fields['second_lang_preference'], student1.fields['second_lang_proficiency'])])
        s1_time = student1.fields['time_preference']
        s1_hour = student1.fields['hours_per_week']
        highest = 0.0

        for student2 in students:
            total = 0.0
            if student2 != student1:
                s2_academic = student2.fields['residency']
                s2_residency = student2.fields['residency']
                s2_gender = (student2.fields['gender'], student2.fields['gender_preference'])
                fluent_lang = student2.fields['fluent_languages'].split(',')
                s2_lang_to_teach = []
                for lang in fluent_lang:
                  s2_lang_to_teach.append((lang, 4))
                s2_lang_to_learn = data_clean([(student2.fields['first_lang_preference'], student2.fields['first_lang_proficiency']),
                    (student2.fields['second_lang_preference'], student2.fields['second_lang_proficiency'])])
                s2_time = student2.fields['time_preference']
                s2_hour = student2.fields['hours_per_week']
                #if sacademic == pacademic:
                    #total += 0.5
                if s1_residency != s2_residency:
                    total += 0.5
                total += gender_score(s1_gender, s2_gender)
                total += language_score((s1_lang_to_teach, s1_lang_to_learn), (s2_lang_to_teach, s2_lang_to_learn))
                total += time_score(s1_time, s2_time, s1_hour, s2_hour)
                total += abs(int(s1_hour)+int(s2_hour))*0.5 - abs(int(s1_hour)-int(s2_hour))*0.5
                if highest < total:
                    highest = total
                    best = student2
                    best_language = (s2_lang_to_teach, s2_lang_to_learn)
        if final < highest:
            final = highest
            best_pair = (student1, best)
            best_language = ((s1_lang_to_teach, s1_lang_to_learn), best_language)
    partner1 = best_pair[0]
    partner2 = best_pair[1]
    p1_name = partner1.fields['name']
    p2_name = partner2.fields['name']
    #language = language_detection(best_language)
    language = partner1.fields['first_lang_preference']
    hours = meetup(s1_time, s2_time)
    #line = p1_name+"("+partner1[3]+")"+"\t"+p2_name+"("+partner2[3]+")\t"+language+"\t"+hours+"\t"+str(final)+"\n"
    #pairs.write(line)
    print language
    writer.writerow({'partner1': p1_name+'('+partner1.fields['sid']+')', 'partner2': p2_name+'('+partner2.fields['sid']+')', 'language(s)': language, 'possible meetup time': hours, 'stability': str(final)})
    students.remove(partner1)
    students.remove(partner2)

#need to check if the student put the right ID number

