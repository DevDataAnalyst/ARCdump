import boto3
import csv
import boto
import json
import re
import collections

target_path = "C:/Personal/My Projects/ARC/ASSIGNMENTS/json/Carrier/"

access_key = 'AKIAIDTJG3XROQ57UDWA'
secret_key = '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'

s3 = boto3.resource('s3',aws_access_key_id=access_key,aws_secret_access_key=secret_key)

obj = s3.Object('arc-tkt-json', 'Master/Carrier/Carrier.dat')
response = obj.get()
lines = response[u'Body'].read().decode('utf-8','ignore').encode("utf-8").split('\n')
fieldnames = ("CARR_NBR","CARR_CD","CARR_CHECK_DIGIT","CARR_NM","CARR_NM_2","CARR_EFF_DT","CARR_EXP_DT","CARR_TYPE_CD","ASP_PARTICIPATION_CD","ASP_PARTICIPATION_START_DT","ASP_PARTICIPATION_END_DT","DIRECT_CONNECT_IND","CRM_ACCT_ID","THREE_LETTER_CD","ARC_STATUS_CD","IATA_PARTICIPATION_START_DT","IATA_PARTICIPATION_END_DT","DUP_IND","ARC_CONTACT_NM","ARC_CONTACT_PHONE_NBR","ARC_ADDR_1","ARC_ADDR_2","ARC_ADDR_3","ARC_CARR_CITY_NM","ARC_CARR_STATE_NM","ARC_CARR_POSTAL_CD","ARC_CARR_CNTRY","ARC_CNTRY_CD","IATA_ADDR_1","IATA_ADDR_2","IATA_CARR_CITY_NM","IATA_CARR_STATE_NM","IATA_CARR_POSTAL_CD","IATA_CARR_CNTRY","IATA_CNTRY_CD","RESERVATION_DEPT_TELETYPE","RESERVATION_CONTACT_NM","RESERVATION_CONTACT_TITLE","RESERVATION_CONTACT_TELETYPE","EMERGENCY_CONTACT_NM","EMERGENCY_CONTACT_TITLE","EMERGENCY_CONTACT_TELETYPE","SITA_MEMBERSHIP_IND","ARINC_MEMBERSHIP_IND","IATA_MEMBERSHIP_IND","ATA_MEMBERSHIP_IND","OPERATION_TYPE_CD")
no_of_fields = len(fieldnames)

one_record = (lines[1])

#print(one_record)
#delim = len(one_record.split("|"))
reader = csv.DictReader(lines,fieldnames,delimiter='|')
#print(reader)
#print(delim)

#len(lines[row])
for row in reader:
    for x in row:
        delim = sum(p == "|" for p in row)
        if delim <= no_of_fields:
            outfile = row.get('CARR_NBR')+'_'+row.get('CARR_CD')
            jsonfile = open(target_path+outfile+'.json','w')
            json.dump(row, jsonfile)
            print(row)
        else:
            print 'DATA NOT CONFORMANT'
# #delim = len(text.split('|'))
# #print(delim)
# #print(type(text))
#
# #print(no_of_fields)
#
# with open('C:/Personal/My Projects/ARC/ASSIGNMENTS/json/data22.json', 'w') as outfile:
#     json.dump(row, outfile)
