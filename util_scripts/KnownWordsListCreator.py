'''
Created on 28-May-2014

@author: brij
'''

def getUniqueWords(filepath):
	unique = set()
	for line in open(filepath):
		if line.strip() != '':
			unique.update([ x.lower().strip() for x in line.split()[1:-1] if not ('$X' in x or '$Y' in x or '$Z' in x) ])
	return unique

def writeUniqueWords(wordset, filepath):
	wf = open(filepath, 'w')
	wf.write(','.join(wordset))
	wf.close()
	

uws = getUniqueWords('/home/brij/Documents/IIIT/Speech/ITRA/LM/language_model.txt')	
writeUniqueWords(uws, '/home/brij/Documents/IIIT/Speech/ITRA/LM/known_words.txt')
