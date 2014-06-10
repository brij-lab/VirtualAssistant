'''
Created on 07-Jun-2014

@author: brij
'''

import xlrd
import re

ONLY_NUM = re.compile('[^0-9]')

workbook = xlrd.open_workbook('/home/brij/Downloads/Tel Directory 27.04.2013.xls')
worksheet = workbook.sheet_by_name('Faculty')
num_rows = worksheet.nrows - 1
num_cells = worksheet.ncols - 1
curr_row = 2

fac_info_file = open('/home/brij/Documents/IIIT/Speech/ITRA/faculty_info', 'w')

def getExtensionString(ext_arr):
	ext_str = ''
	count = 0
	for extval in ext_arr:
		if not (extval.strip() == '' or extval.strip() == '-'):
			if count > 0:
				ext_str += ','
			count += 1
			if 'R' in extval:
				ext_str += '5:' + ONLY_NUM.sub('', extval)
			else:
				ext_str += '2:' + ONLY_NUM.sub('', extval)
	return ext_str
	
def getNumberString(num_arr):
	num_str = ''
	count = 0
	for numval in num_arr:
		if not (numval.strip() == '' or numval.strip() == '-'):
			if count > 0:
				num_str += ','
			count += 1
			numval = numval.split('.')[0]
			if len(numval) == 8:
				num_str += '3:' + ONLY_NUM.sub('', numval)
			else:
				num_str += '4:' + ONLY_NUM.sub('', numval)
	return num_str	

while curr_row < num_rows:
	curr_row += 1
	row = worksheet.row(curr_row)
	#print 'Row:', curr_row
	fac_name = worksheet.cell_value(curr_row, 1).split('\n')[0]
	ext_value = str(worksheet.cell_value(curr_row, 2)).split('\n')
	num_value = str(worksheet.cell_value(curr_row, 3)).split('\n')
	#print fac_name, ext_value, num_value
	fac_name = fac_name.strip()
	if fac_name != '':
		line = fac_name + '\t'
		ext_str = getExtensionString(ext_value)
		if ext_str != '':
			line += ext_str + ','
		num_str = getNumberString(num_value)
		if num_str != '':
			line += num_str
		print line
		fac_info_file.write(line + '\n')
fac_info_file.close()
		
