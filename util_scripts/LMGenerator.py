'''
Created on 28-May-2014

@author: brij
'''
from string import Template

y_set = ('phone', 'office', 'residential', 'residential extension', 'mobile' , 'extension', 'residence', 'office extension', 'home', 'cell')
z_set = ('mr', 'mrs', 'dr', 'mister', 'missus', 'doctor', 'sir', 'professor', 'prof')

def buildXSet(filename):
	print "Finding all the synonyms to substitute in place of X..."
	x_set = []
	x_file = open(filename)  # '/home/brij/Documents/IIIT/Speech/LM/faculty_synset'
	for line in x_file:
		if line.strip() != "":
			vals = line.split('-->')
			x_set.append(vals[0].strip())
			syns = vals[1]
			syns = syns[syns.find("(") + 1:syns.find(")")]
			for syn in syns.split(','):
				x_set.append(syn.strip())
	print "Done!"
	return x_set

def generateLM(template_file_path, x_set):
	print "Generating all possible sentences..."
	template_file = open(template_file_path)
	lm_file = open('/home/brij/Documents/IIIT/Speech/LM/lm.txt', 'w')
	count = 0
	for template in template_file:
		if template.strip() != '':
			t1 = Template(template)
			for x_val in x_set:
				x_sub = t1.safe_substitute(X=x_val)
				if '$Y' in x_sub:
					t2 = Template(x_sub)
					for y_val in y_set:
						y_sub = t2.safe_substitute(Y=y_val)
						if '$Z' in y_sub:
							t3 = Template(y_sub)
							for z_val in z_set:
								z_sub = t3.safe_substitute(Z=z_val)
								lm_file.write(z_sub.lower())
								count = count + 1
								if count % 1000 == 0:
									print "Generated %d sentences..." % count
						else:
							lm_file.write(y_sub.lower())
							count = count + 1
							if count % 1000 == 0:
								print "Generated %d sentences..." % count
				else:
					lm_file.write(x_sub.lower())
					count = count + 1
					if count % 1000 == 0:
						print "Generated %d sentences..." % count
	print "Done! Generated total %d sentences." % count
                
x_set = buildXSet('/home/brij/Documents/IIIT/Speech/LM/faculty_synset')
generateLM("/home/brij/Documents/IIIT/Speech/LM/language_model.txt", x_set)
               



