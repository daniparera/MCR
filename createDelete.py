import os

fi = open('input_delete.txt','r')
num_lines = sum(1 for line in fi) # get number of lines
fi.seek(0, 0)

fo = open('output_delete.txt','w')

def select_rel(n):
	if (n == '~'): return 12
	if (n == '<'): return 70

bd_flag = 0 #0 no DB. Or 1 with DB

# BD con, and get languages
if (bd_flag == 1):
	import MySQLdb

	db = MySQLdb.connect(host="host", user="user", passwd="passwd", db="db") 
	cur = db.cursor(MySQLdb.cursors.DictCursor) 
	cur.execute("select * FROM wei_languages")
	languages = cur.fetchall()

# NO BD, get languages
if (bd_flag == 0):
	languages = ['eng-30', 'cat-30', 'eus-30', 'glg-30' , 'spa-30']

for line in fi:

	tmp, relation = line.rstrip().split(' ')
	x, y = tmp.rstrip().split('#')

	rl = str(select_rel(relation))

	for elem in languages:

		if (bd_flag == 1): lng = elem["code"]
		if (bd_flag == 0): lng = elem

		fo.write('DELETE FROM `wei_'+lng+'_relation` WHERE relation=\''+rl+'\' AND sourceSynset=\''+lng+'-'+x+'\' AND targetSynset=\''+lng+'-'+y+'\';\n')

	fo.write('\n\n')

fo.close()
fi.close()
