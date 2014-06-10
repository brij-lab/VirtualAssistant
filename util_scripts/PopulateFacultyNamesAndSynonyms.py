'''
Created on 07-Jun-2014

@author: brij
'''

import MySQLdb
from string import Template

db = MySQLdb.connect(host="localhost", user="root", passwd="root", db="facultycontact")
cur = db.cursor()
INSERT_FACULTY_NAME = Template("INSERT INTO facultycontact.faculty_names (name) VALUES ('$name')")
GET_FACULTY_ID = Template("SELECT id FROM facultycontact.faculty_names WHERE name='$name'")
INSERT_SYNONYM = Template("INSERT INTO facultycontact.synonyms (syn, faculty_id) VALUES ('$syn', '$faculty_id')")
#cur.execute("SELECT * FROM facultycontact.info_type")

def getFacultyID(fac_name):
	# Check if name exists in DB
	sql = GET_FACULTY_ID.safe_substitute(name=fac_name)
	cur.execute(sql)
	fac_id = ''
	if cur.rowcount == 1:
		#if exists get its ID
		res = cur.fetchone()
		fac_id = res[0]
	else:
		#if does not exists then insert it and get ID
		sql = INSERT_FACULTY_NAME.safe_substitute(name=fac_name)
		try:
			cur.execute(sql)
			db.commit()
			sql = GET_FACULTY_ID.safe_substitute(name=fac_name)
			cur.execute(sql)
			res = cur.fetchone()
			fac_id = res[0]
		except:
			db.rollback()
	return fac_id

def populateSynDict(filename):
	print "Populating DB with faculty names and synonyms dictionary..."
	syn_dict = {}
	syn_file = open(filename)  # '/home/brij/Documents/IIIT/Speech/LM/faculty_synset'
	for line in syn_file:
		if line.strip() != "":
			vals = line.split('-->')
			fac_name = vals[0].strip()
			fac_id = getFacultyID(fac_name)
			syns = vals[1]
			syns = syns[syns.find("(") + 1:syns.find(")")]
			syn_arr = syns.split(',') + [fac_name]
			for syn in syn_arr:
				synval = syn.strip().lower()
				if synval in syn_dict:
					syn_dict[synval] = syn_dict[synval] + ',' + str(fac_id)
				else:
					syn_dict[synval] = str(fac_id)
	print "Done!"
	return syn_dict

synonyms = populateSynDict('/home/brij/Documents/IIIT/Speech/LM/faculty_synset')
#print synonyms
for syn, fac_id in synonyms.iteritems():
	sql = INSERT_SYNONYM.safe_substitute(syn=syn, faculty_id=fac_id)
	try:
		cur.execute(sql)
		db.commit()
	except:
		db.rollback()

#disconnect from server
db.close()
	
