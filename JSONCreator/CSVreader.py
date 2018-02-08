# # # importing csv module
# # import csv
# #
# # # csv file name
# # filename = "C:/Personal/My Projects/ARC/AWSdump/CARRIER.dat"
# #
# # # initializing the titles and rows list
# # fields = []
# # rows = []
# #
# # # reading csv file
# # with open(filename, 'r') as csvfile:
# #     # creating a csv reader object
# #     csvreader = csv.reader(csvfile)
# #
# #     # extracting field names through first row
# #     fields = next(csvreader)
# #
# #     # extracting each data row one by one
# #     for row in csvreader:
# #         rows.append(row)
# #
# #     # get total number of rows
# #     print("Total no. of rows: %d" % (csvreader.line_num))
# #
# # # printing the field names
# # print('Field names are:' + ', '.join(field for field in fields))
# #
# # #  printing first 5 rows
# # print('\nFirst 5 rows are:\n')
# # for row in rows[:5]:
# #     # parsing each column of a row
# #     for col in row:
# #         print("%10s" % col),
# #     print('\n')
#
#
#
#
# import json
#
# data = {}
# data['people'] = []
# data['people'].append({
#     'name': 'Scott',
#     'website': 'stackabuse.com',
#     'from': 'Nebraska'
# })
# data['people'].append({
#     'name': 'Larry',
#     'website': 'google.com',
#     'from': 'Michigan'
# })
# data['people'].append({
#     'name': 'Tim',
#     'website': 'apple.com',
#     'from': 'Alabama'
# })
#
# with open('C:/Personal/My Projects/ARC/ASSIGNMENTS/json/data.json', 'w') as outfile:
#     json.dump(data, outfile)


#
# list_of_lists = [ [1, 2, 3], [4, 5, 6], [7, 8, 9]]
# for list in list_of_lists:
#     for x in list:
#         print len(list)

while True:
	print("Enter 'x' for exit.")
	string = input("Enter any string: ")
	if string == 'x':
		break
	else:
		char = input("Enter a character to count: ")
		val = string.count(char)
		print(val,"\n")