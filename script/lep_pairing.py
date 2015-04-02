import csv

class Student:
  def __init__(self, fields):
    self.fields = fields # hash table of user fields


users = open("script/newsheet.csv", "r")
students = []
pairs = []
language_prof = {1:"Elementary proficiency", 2:"Limited proficiency", 3:"Intermediate proficiency", 4:"Nearly-full professional proficiency"}

def init():
  reader = csv.DictReader(users)
  for row in reader:
    fields = {'name': row['first_name'] + row['last_name'], 'gender': row['gender'], 'gender_preference': row['gender_preference']\
        'fluent_languages': row['fluent_languages'], 'lang_additional_info': row['lang_additional_info'], 'first_lang_preference': row['first_lang_preference'], \
        'first_lang_proficieny': row['first_lang_proficiency'], 'second_lang_preference': row['second_lang_preference'], 'time_preference': row['time_preference'], 'time_additional_info': row['time_additional_info']}

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
		#single_name = students[0][1] + " " + students[0][2]+"\n"
		#pairs.write(single_name)
    student = students.keys()[0].fields['name'] + \
    pairs.writerow({'partner1': student})
    break
	final = 0
	for student1 in students:
		s1_academic = student.fields['academic_title']
		s1_residency = student.fields['residency']
		s1_gender = (student[8], student[25])
		sn = get_profi(student)
		sl = student[9].split(",")
		sn = data_clean(((sl, sn), (student[14], student[15]), (student[16], student[17])))
		si = data_clean(((student[10], student[11]), (student[12], student[13])))
		stime = student[19:24]
		shour = student[24]
		highest = 0

		for student2 in students:
			total = 0
			if student2 != student1:
				pacademic = stduent2.fields['residency']
				presidency = student2.fields['residency']
				pgender = (potential[8], potential[25])
				pn = get_profi(potential)
				pl = potential[9].split(",")
				pn = data_clean(((pl, pn), (potential[14], potential[15]), (potential[16], potential[17])))
				pi = data_clean(((potential[10], potential[11]), (potential[12], potential[13])))
				ptime = potential[19:24]
				phour = potential[24]
				#if sacademic == pacademic:
					#total += 0.5
				if sresidency != presidency:
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




