import csv
import json
path="E:\My D n A\ARC\files"
target_path = ""

csvfile = open(path="carrier.dat",'r')
filedimnames = {"field1","field2"}
reader = csv.DictReader(csvfile,fieldnames,delimiter='|')
for row in reader:
	print row
	outfile = row.get('CARR_NUM')+'_'+row.get('CARR_CD')
	#print 'file_name
	jsonfile = open(target_path+outfile + '.json', 'w')
	json.dump(row, jsonfile)