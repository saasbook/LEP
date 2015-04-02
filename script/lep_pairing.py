import csv

class Student:
  def __init__(self, fields):
    self.fields = fields # hash table of user fields


users = open("script/newsheet.csv", "r")
students = []
pairs = []
language_prof = {1:"Elementary proficiency", 2:"Limited proficiency", 3:"Intermediate proficiency", 4:"Nearly-full professional proficiency"}

def setup():
  reader = csv.DictReader(users)
  for row in reader:
    fields = {'name': row['first_name'] + row['last_name'], 'gender': row['gender'], 'gender_preference': row['gender_preference'],
        'fluent_languages': row['fluent_languages'], 'lang_additional_info': row['lang_additional_info'], 'first_lang_preference': row['first_lang_preference'], \
        'first_lang_proficieny': row['first_lang_proficiency'], 'second_lang_preference': row['second_lang_preference'], 'time_preference': row['time_preference'],
        'hours_per_week': row['hours_per_week']}
    s = Student(fields)
    students.append(s)

  close(users)

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

def gender_score(g1, g2):
    if g2[1] == "Indifferent" and g1[1] == 'Indifferent':
        return 1
    if g1[1] == g2[0] and g2[1] == g1[0]:
        return 5
    if (g1[1] == g2[0] and g2[1] == 'Indifferent') or (g1[0]==g2[1] and g1[1] == 'Indifferent'):
        return 3
    else:
        return 0

def data_clean(languages):
    cleaned = []
    ls = []
    for (l, p) in languages:
        if type(l) == list:
            for i in range(len(l)):
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
    for (sl, spro) in sn:
        for (pl, ppro) in pi:
            if sl == pl:
                total += 3 - abs(spro-ppro)*0.5
    for (pl, ppro) in pn:
        for (sl, spro) in si:
            if sl == pl:
                total += 3 - abs(spro-ppro)*0.5
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

def time_score(stime, ptime, shour, phour):
    total = 0
    for i in range(5):
        s_time = stime[i].split(",")
        p_time = ptime[i].split(",")
        for st in s_time:
            for pt in p_time:
                if st==pt:
                    total += 1
    if total > max(shour, phour):
        return 2
    elif total > min(shour, phour):
        return 1
    return 0

def meetup(s1, s2):
    t = ''
    stime = s1[19:24]
    ptime = s2[19:24]
    week = {0:"Monday: ", 1:"Tuesday: ", 2:"Wednesday: ", 3:"Thursday: ", 4:"Friday: "}
    for i in range(5):
        check = True
        s_time = stime[i].split(",")
        p_time = ptime[i].split(",")
        t += week[i]
        for st in s_time:
            for pt in p_time:
                if st==pt:
                    if check:
                        t += st
                        check = False
                    else:
                        t += "," + st
        if i!=4:
            t += "; "
    return t

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

pairs = open('script/final_pairs.csv', 'w')
fields = ['partner1', 'partner2', 'languages(s)', 'possible meetup time', 'stability']
writer = csv.DictWriter(pairs, fieldnames=fields)
writer.writeheader()
#pairs.write("partner1\tpartner2\tlanguage(s)\tPossible Meetup time\tstability\n")

# attempt to pair every student with another student
while len(students) != 0:
    print(len(students))
    if len(students) == 1:
        student = students.keys()[0].fields['name']
        pairs.writerow({'partner1': student})
        break
    final = 0
    for student1 in students:
        s1_academic = student1.fields['academic_title']
        s1_residency = student1.fields['residency']
        s1_gender = (student1.fields['gender'], student1.fields['gender_preference'])
        s1_lang_to_teach = student1.fields['fluent_langugaes'].split(',')
        s1_lang_to_learn = data_clean([(student.fields['first_lang_preference'], student1.fields['first_lang_proficiency']),
              (student1.fields['second_lang_preference'], student1.fields['second_lang_proficiency'])])
        s1_time = student1.fields['time_preference']
        s1_hour = student1.fields['hours_per_week']
        highest = 0

        for student2 in students:
            total = 0
            if student2 != student1:
                s2_academic = student2.fields['residency']
                s2_residency = student2.fields['residency']
                s2_gender = (student2.fields['gender'], student2.fields['gender_preference'])
                s2_lang_to_teach = student2.fields['fluent_languages'].split(',')
                s2_lang_to_learn = data_clean([(student2.fields['first_lang_preference'], student2.fields['first_lang_proficiency']),
                    (student2.fields['second_lang_preference'], student2.fields['second_lang_proficiency'])])
                s2_time = student2.fields['time_preference']
                s2_hour = student2.fields['hour_per_week']
                #if sacademic == pacademic:
                    #total += 0.5
                if s1_residency != s2_residency:
                    total += 0.5
                total += gender_score(sgender, pgender)
                total += language_score((sn, si), (pn, pi))
                total += time_score(stime, ptime, shour, phour)
                total += abs(int(shour[0])+int(phour[0]))*0.5 - abs(int(shour[0])-int(phour[0]))*0.5 
                if highest < total:
                    highest = total
                    best = potential
                    best_pl = (pn, pi)
        if final < highest:
            final = highest
            best_pair = (student, best)
            best_language = ((sn, si), best_pl)
    partner1 = best_pair[0]
    partner2 = best_pair[1]
    p1_name = partner1[1]+" "+partner1[2]
    p2_name = partner2[1]+" "+partner2[2]
    language = language_detection(best_language)
    hours = meetup(partner1, partner2)
    #line = p1_name+"("+partner1[3]+")"+"\t"+p2_name+"("+partner2[3]+")\t"+language+"\t"+hours+"\t"+str(final)+"\n"
    #pairs.write(line)
    writer.writerow({'partner1': p1_name+'('+partner[3]+')', 'partner2': p2_name+'('+partner2[3]+')', 'language(s)': language, 'possible meetup time': hours, 'stability': str(final)})
    students.remove(partner1)
    students.remove(partner2)

#need to check if the student put the right ID number




