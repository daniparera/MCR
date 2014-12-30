import os
import MySQLdb

def select_rel(n):

	if (n == 1) : return '='		#
	if (n == 2) : return '>'		#
	if (n == 4) : return '\\'
	if (n == 6) : return '#s'		#
	if (n == 7) : return '#m'		#
	if (n == 8) : return '#p'		#
	if (n == 12): return '~'
	if (n == 19): return '*'		#
	if (n == 33): return '!'
	if (n == 34): return '&'		#
	if (n == 49): return '^'
	if (n == 52): return '$'		#
	if (n == 61): return 'gloss'	#
	if (n == 64): return '+'
	if (n == 63): return '-c'
	if (n == 66): return '-r'
	if (n == 68): return '-u'
	if (n == 70): return '<'

db = MySQLdb.connect(host="host", user="user", passwd="passwd", db="db") 
cur = db.cursor(MySQLdb.cursors.DictCursor) 
cur.execute("select * FROM wei_languages")
rows = cur.fetchall()

# read input file, format's description in 'input_sel.txt' file
with open('input_sel.txt','r') as fi:
	line = fi.readline()	# only read first line

	#rl = str(select_rel(relation))
	select, relation, like_cond = line.rstrip().split(';')

	num_fields = 0	# auxiliar variable for correct construction of string. 
	sel_str = ''
	sel_arr = []
	for spl in select.rstrip().split('#'): 
		for var in spl.split(' '): 
			sel_arr.append(var)				# store all element in array to search function
			if (num_fields == 0): sel_str=var		# construct a string for the query
			if (num_fields >  0): sel_str=sel_str+', '+var
			num_fields += 1

	num_fields = 0
	cond_str = '' 
	if (relation != ""): 									# put some relation to search?
		for sel in relation.rstrip().split('#'): 
			if (cond_str==""):	cond_str = "WHERE (relation = "+sel		# first relation to search
			else:			cond_str =  cond_str+" OR relation = "+sel	# next relation to search


	if (like_cond != ""):
		if (cond_str != ""):
			cond_str = cond_str+" ) AND ( "						# close search open like, staments
		else:
			cond_str = cond_str+" WHERE ( "						# open like, staments
		condition = True
		while condition:
			# what we do with the like string? find the OR/AND substring and split... or get las element
			print like_cond
			if (like_cond.find('AND')==-1 and like_cond.find('OR')==-1): 			  	
					now = like_cond
					like_cond = ''
					op = ''
			elif(like_cond.find('AND')>like_cond.find('OR') or like_cond.find('OR')==-1): 	
				now, like_cond = like_cond.split("AND")
				op = 'AND'
			else:
				now, like_cond = like_cond.split("OR")
				op = 'OR'

			if (now.find('!=')>-1):	
				x, y = now.split('!=')
				not_str = 'NOT'

			if (now.find('==')>-1):	
				x, y = now.split('==')
				not_str = ''
					
			if(len(y)==y.find('%')+1): y="*-"+y	#trick: put a mark for mare later change by language 

			if (cond_str == ""): 
				cond_str = cond_str+x+" "+not_str+" LIKE '"+y+"'"		  # if dont have relations
			else:
				cond_str = cond_str+" "+x+" "+not_str+" LIKE '"+y+"' "+op # anyway, add another condition
			if(len(like_cond)<=0): condition = False
		cond_str = cond_str+" )"						# close like stament
	elif(cond_str != ""):
		cond_str = cond_str+" )"							# close search stament


# we build lists of file_outputs.
languages = []
for row in rows: languages.append(row["code"])

for lng in languages:
	fo = open('output_sel_'+lng+'.txt','w')

	query = "SELECT "+sel_str+" FROM `wei_"+lng+"_relation` "+cond_str+";"

	query = query.replace("*", lng);	#trick: change the mark by the language 

	print query
	cur.execute(query)
	rows = cur.fetchall()

	for row in rows:
		for search in sel_arr:

			# write the field and the separator in output file. if we have synset only write numbers  >!< substring  
			if (search=='sourceSynset' or search=='targetSynset'): 	fo.write(str(row[search][len(lng)+1:]))
			elif(search=='relation'):				fo.write(select_rel(row[search]))
			else: 							fo.write(str(row[search]))

			pos = select.find(search); # find in select string the position of the separator

			# if we have separator to write, we write it (only if position is in the select string)
			if(len(search)+pos < len(select)): fo.write(select[pos+len(search)])
		fo.write("\n")
	fo.close()
