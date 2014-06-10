'''
Created on 07-Jun-2014

@author: brij
'''

import MySQLdb
from string import Template

db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="facultycontact")
cur = db.cursor()
INSERT_FACULTY_INFO = Template("INSERT INTO facultycontact.faculty_info (faculty_id, type, info) VALUES ($faculty_id, $infotype, '$info')")
GET_FACULTY_ID = Template("SELECT id FROM facultycontact.faculty_names WHERE name='$name'")

print "Populating faculty info..."
for line in open('/home/brij/Documents/IIIT/Speech/ITRA/faculty_info'):
	if line.strip() != '':
		linesp = line.split('\t')
		fac_name = linesp[0].strip()
		sql = GET_FACULTY_ID.safe_substitute(name=fac_name)
		cur.execute(sql)
		if cur.rowcount == 1:
			res = cur.fetchone()
			fac_id = res[0]
			numvals = linesp[1].strip().split(',')
			for num in numvals:
				num = num.strip()
				if num != '':
					numarr = num.split(':')
					sql = INSERT_FACULTY_INFO.safe_substitute(faculty_id=fac_id, infotype=numarr[0], info=numarr[1])
					try:
						cur.execute(sql)
						db.commit()
					except:
						db.rollback()
	
print "Done!"	
db.close()
