import boto3
import boto
import csv
import json
import boto.s3.connection
from boto.s3.connection import OrdinaryCallingFormat
access_key = 'AKIAIDTJG3XROQ57UDWA'
secret_key = '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'

s3 = boto3.resource('s3',aws_access_key_id=access_key,aws_secret_access_key=secret_key)

obj = s3.Object('arc-tkt-json', 'Master/Carrier/CARRIER.dat')
response = obj.get()
lines = response[u'Body'].read().split('\n')
fieldnames = ("CARR_NBR","CARR_CD","CARR_CHECK_DIGIT","CARR_NM","CARR_NM_2","CARR_EFF_DT","CARR_EXP_DT","CARR_TYPE_CD","ASP_PARTICIPATION_CD","ASP_PARTICIPATION_START_DT","ASP_PARTICIPATION_END_DT","DIRECT_CONNECT_IND","CRM_ACCT_ID","THREE_LETTER_CD","ARC_STATUS_CD","IATA_PARTICIPATION_START_DT","IATA_PARTICIPATION_END_DT","DUP_IND","ARC_CONTACT_NM","ARC_CONTACT_PHONE_NBR","ARC_ADDR_1","ARC_ADDR_2","ARC_ADDR_3","ARC_CARR_CITY_NM","ARC_CARR_STATE_NM","ARC_CARR_POSTAL_CD","ARC_CARR_CNTRY","ARC_CNTRY_CD","IATA_ADDR_1","IATA_ADDR_2","IATA_CARR_CITY_NM","IATA_CARR_STATE_NM","IATA_CARR_POSTAL_CD","IATA_CARR_CNTRY","IATA_CNTRY_CD","RESERVATION_DEPT_TELETYPE","RESERVATION_CONTACT_NM","RESERVATION_CONTACT_TITLE","RESERVATION_CONTACT_TELETYPE","EMERGENCY_CONTACT_NM","EMERGENCY_CONTACT_TITLE","EMERGENCY_CONTACT_TELETYPE","SITA_MEMBERSHIP_IND","ARINC_MEMBERSHIP_IND","IATA_MEMBERSHIP_IND","ATA_MEMBERSHIP_IND","OPERATION_TYPE_CD")
reader = csv.DictReader(lines,fieldnames,delimiter='|')
for row in reader:

    #outfile = row.get('CARR_NBR')+'_'+row.get('CARR_CD')
    outfile = row.get('CARR_CD')
    obj = s3.Object('arc-tkt-json','Master/Carrier/'+outfile+'.json')
    obj.put(Body=json.dumps(row))
