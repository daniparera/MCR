import textwrap, argparse
import os, sys, re
import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='extractRelations',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         extract relations from Wordnet
         --------------------------------

             example of use $python3 %(prog)s [[--debug]]
         '''))

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')

args = parserarg.parse_args()

debug = not(bool(args.debug))

def get_participle(files_array):

	pair = []
	num_relacions = 0
	num_ficheiro = ''

	for file in files_array:

  		string = open("./data/"+file, 'r').read()
		counter = 0

		#matches0 = re.findall("@^(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\<]\s\d{8}\s([anrvs])\s.+)$@m", string)
		matches0 = re.findall("(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\<]\s\d{8}\s([anrvs])\s.+)", string)

		for c1, c2, rels, c4 in matches0:

			#matches = re.findall("@\s[\<]\s(\d{8})\s([anrvs])\s@", rels)
			matches = re.findall("\s[\<]\s(\d{8})\s([anrvs])\s", rels)
   				
			for t,n in matches:

				source = c1+"-"+c2
				target = t+"-"+n

				pair.append( ( source.replace('s', 'a') , target.replace('s', 'a') ) )

				counter = counter + 1

  		num_ficheiro = num_ficheiro+"\n"+str(counter)+" relations participle in <<"+file+">>\n"
		num_relacions = counter + num_relacions;

	print "\t\t\t\t\t\tCandidates:"+str(num_relacions)+"\n"+num_ficheiro 
	print "===============================================================================\n" 
	return pair

def get_derived(files_array):

	pair = []
	num_relacions = ''
	num_ficheiro = ''

	for file in files_array:

  		string = open("./data/"+file, 'r').read()
		counter = 0

		#matches0 = re.findall("@^(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\+]\s\d{8}\s([anrvs])\s.+)$@m", string)
		matches0 = re.findall("(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\+]\s\d{8}\s([anrvs])\s.+)", string)

		for c1, c2, rels, c4 in matches0:

			#matches = re.findall("@\s[\+]\s(\d{8})\s([anrvs])\s@", rels)
			matches = re.findall("\s[\+]\s(\d{8})\s([anrvs])\s", rels)
   				
			for t,n in matches:

				source = c1+"-"+c2
				target = t+"-"+n

				pair.append( ( source.replace('s', 'a') , target.replace('s', 'a') ) )

				counter = counter + 1

  		num_ficheiro = num_ficheiro+"\n"+str(counter)+" relations derivationally_derived_form in <<"+file+">>\n"
		num_relacions = str(counter) + num_relacions;

	print "\t\t\t\t\t\tCandidates:"+num_relacions+"\n"+num_ficheiro
	print "===============================================================================\n" 
	return pair

def get_pertainym(files_array):

	pair = []
	num_relacions = ''
	num_ficheiro = ''

	for file in files_array:

  		string = open("./data/"+file, 'r').read()
		counter = 0

		link_re = re.compile('(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\\\]\s\d{8}\s([anrvs])\s.+)')
		links = link_re.findall(string)

		#matches0 = re.findall("@^(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\\\]\s\d{8}\s([anrvs])\s.+)$@m", string)
		matches0 = re.findall("(\d{8})\s\d{2}\s([anrvs])(\s.+\s[\\\]\s\d{8}\s([anrvs])\s.+)", string)

		for c1, c2, rels, c4 in matches0:

			#matches = re.findall("@\s[\\\]\s(\d{8})\s([anrvs])\s@", rels)
			matches = re.findall("\s[\\\]\s(\d{8})\s([anrvs])\s", rels)
   				
			for t,n in matches:

				source = c1+"-"+c2
				target = t+"-"+n

				pair.append( ( source.replace('s', 'a') , target.replace('s', 'a') ) )

				counter = counter + 1

  		num_ficheiro = num_ficheiro+"\n"+str(counter)+" relations pertainym in <<"+file+">>\n"
		num_relacions = str(counter) + num_relacions;

	print "\t\t\t\t\t\tCandidates:"+num_relacions+"\n"+num_ficheiro 
	print "===============================================================================\n" 
	return pair

def get_eng_variants(offset):

	offset = offset.replace('s', 'a')
	lang_code = "eng"
	v = []
	variants = ""
	query_variants = "SELECT `wei_eng-30_variant`.word, `wei_eng-30_variant`.experiment FROM `wei_eng-30_variant` WHERE `wei_eng-30_variant`.offset = '"+offset+"' ORDER BY LOWER(`word`) COLLATE utf8_general_ci"

	cur.execute(query_variants)
	rows = cur.fetchall()

# $result_variants = mysql_query($query_variants) or die('Query failed: ' . mysql_error());
# $num_variants = mysql_num_rows($result_variants);
# while ($var = mysql_fetch_row($result_variants)) {
	num_variants = len(rows)

	for var in rows:
		if (lang_code == "glg" and num_variants == 1 ): variants = var['word']+" {"+var['experiment']+"}"
		elif (lang_code == "glg" and num_variants > 1 ): v.append(var['word'])+" {"+var['experiment']+"}"
		elif (num_variants > 1): v.append(var['word'])
		elif (num_variants == 1): variants = var['word'];
	
	if (len(v) > 1): variants = ', '.join(v)
	if (lang_code == "glg" and variants == ""): variants = "*****"

	return variants;

files = ["data.adv", "data.adj", "data.verb", "data.noun"]

#name_tsv="derived.tsv"
#ruta_tsv="/tmp/"+name_tsv
#ruta_sql="/tmp/pertainym_related_to.sql"
#ruta_pertainym="/tmp/pertainym.tsv"

#ruta_pertainym_sql="/tmp/pertainym.sql";

linhas = []
linhas_sql = []
linhas_pertainym = []
linhas_pertainym_sql = []
repeticions_pertainym = []
repeticions = []
#repeticions_inversa = []
ordinal = 0;

pertainym = get_pertainym(files)
print "<b>- Search relations pertainym: </b>"

for sourceSynset, targetSynset in pertainym:

	#targetSynset = pertainym['target'][n]
	pos_source = sourceSynset[-1:]
	#if ($pos_source == "s") $pos_source = "a"; 
	pos_target = targetSynset[-1:]
	#if ($pos_target == "s") $pos_target = "a"; 
	linha0= "47\teng-30-"+sourceSynset+"\t"+pos_source+"\teng-30-"+targetSynset+"\t"+pos_target+"\t99\tmn\t1\ten30\n"
	#linha0_inversa= "47\teng-30-".$targetSynset."\t".$pos_target."\teng-30-".$sourceSynset."\t".$pos_source."\t99\tmn\t1\ten30\n";
	linha_sql= "(47,'eng-30-"+sourceSynset+"','"+pos_source+"','eng-30-"+targetSynset+"','"+pos_target+"',99,'mn','1','en30')"
	#linha_sql_inversa= "(47,'eng-30-".$targetSynset."','".$pos_target."','eng-30-".$sourceSynset."','".$pos_source."',99,'mn','1','en30');\n";
	if linha0 not in linhas_pertainym and sourceSynset <> targetSynset:
  		ordinal = ordinal + 1
		print str(ordinal)+"<b> | pertains_to: </b> "+sourceSynset+" "+get_eng_variants("eng-30-"+sourceSynset)+"<b> | has_pertainym: </b>"+targetSynset+" "+get_eng_variants("eng-30-"+targetSynset)
		linhas_pertainym.append(linha0) 
		linhas_pertainym_sql.append(linha_sql) 
	else: repeticions_pertainym.append(linha0) 

print "===============================================================================\n" 
print "Relations pertainym: "+str(len(linhas_pertainym))+"\nRepetead: "+str(len(repeticions_pertainym))

participle = get_participle(files)
print "<b>- Search relations participle: </b>";

for sourceSynset, targetSynset in participle:

	#targetSynset = $participle['target'][n];
 	pos_source = sourceSynset[-1:]
	#if ($pos_source == "s") $pos_source = "a"; 
	pos_target = targetSynset[-1:]
	#if ($pos_target == "s") $pos_target = "a"; 
	linha0= "64\teng-30-"+sourceSynset+"\t"+pos_source+"\teng-30-"+targetSynset+"\t"+pos_target+"\t99\tmn\t1\ten30\n"
	linha0_inversa= "64\teng-30-"+targetSynset+"\t"+pos_target+"\teng-30-"+sourceSynset+"\t"+pos_source+"\t99\tmn\t1\ten30\n"
	linha_sql= "(64,'eng-30-"+sourceSynset+"','"+pos_source+"','eng-30-"+targetSynset+"','"+pos_target+"',99,'mn','1','en30')"
	linha_sql_inversa= "(64,'eng-30-"+targetSynset+"','"+pos_target+"','eng-30-"+sourceSynset+"','"+pos_source+"',99,'mn','1','en30')"
	
	if linha0 not in linhas and linha0_inversa not in linhas and sourceSynset <> targetSynset:
		ordinal = ordinal + 1
		print str(ordinal)+" "+sourceSynset+" "+get_eng_variants("eng-30-"+sourceSynset)+"<b> | related_to | </b>"+targetSynset+" "+get_eng_variants("eng-30-"+targetSynset)
		#$linhas_participle[] = $linha0; 
		#$linhas_participle_sql[] = $linha_sql; 
		linhas.append(linha0) 
		linhas.append(linha0_inversa) 
		linhas_sql.append(linha_sql) 
		linhas_sql.append(linha_sql_inversa) 
	else: repeticions.append(linha0)

derived = get_derived(files)
print "<b>- Search relations derivationally_derived_form: </b>"

for sourceSynset, targetSynset in derived:

	#targetSynset = derived['target'][n];
	pos_source = sourceSynset[-1:]
	if (pos_source == "s"): pos_source = "a" 
	pos_target = targetSynset[-1:]
	if (pos_target == "s"): pos_target = "a" 
	linha0= "64\teng-30-"+sourceSynset+"\t"+pos_source+"\teng-30-"+targetSynset+"\t"+pos_target+"\t99\tmn\t1\ten30\n"
	linha0_inversa= "64\teng-30-"+targetSynset+"\t"+pos_target+"\teng-30-"+sourceSynset+"\t"+pos_source+"\t99\tmn\t1\ten30\n"
	linha_sql= "(64,'eng-30-"+sourceSynset+"','"+pos_source+"','eng-30-"+targetSynset+"','"+pos_target+"',99,'mn','1','en30')"
	linha_sql_inversa= "(64,'eng-30-"+targetSynset+"','"+pos_target+"','eng-30-"+sourceSynset+"','"+pos_source+"',99,'mn','1','en30')"

	if linha0 not in linhas and linha0_inversa not in linhas and sourceSynset <> targetSynset:
		ordinal = ordinal + 1
		print str(ordinal)+" "+sourceSynset+" "+get_eng_variants("eng-30-"+sourceSynset)+"<b> | related_to | </b>"+targetSynset+" "+get_eng_variants("eng-30-"+targetSynset)
		linhas.append(linha0) 
		linhas.append(linha0_inversa) 
		linhas_sql.append(linha_sql) 
		linhas_sql.append(linha_sql_inversa) 
	else: repeticions.append(linha0)

print "===============================================================================\n" 
print "Relations related_to: "+str(len(linhas))+"\nRepetead: "+str(len(repeticions))

#print "<hr><div>Relacions related_to: "+str(len(linhas))+"</div><div>Repeticions: "+str(len(repeticions))+"</div><div>Erros preg: "+preg_last_error()+"</div><div style=\"min-width:100%;text-align:center;margin:2pt auto;\"><!--<a href=\"download.php?download="+name_tsv+"\">Descargar "+name_tsv+"</a>--></div>"
