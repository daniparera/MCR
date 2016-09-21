use strict;
use DBI;

use POSIX qw(strftime);
my $date = strftime "%Y-%m-%d", localtime;

my $mcr = DBI->connect("DBI:mysql:database=mcr9;host=adimen.si.ehu.es", "guest", "guest", { mysql_skip_secure_auth => 1 });

my $names_query = "SET NAMES utf8";
my $names = $mcr->prepare($names_query);
$names->execute();

my $characters_query  = "SET CHARACTER SET utf8";
my $characters = $mcr->prepare($characters_query);
$characters->execute();


my $lang_id = $ARGV[0];

#Head

print '<?xml version="1.0" encoding="UTF-8"?>'."\n";
print '<!DOCTYPE LexicalResource SYSTEM "kyoto_wn.dtd">'."\n";

my $tab = "";

my %axis;

# Beging of LexicalResource - ROOT - 

print '<LexicalResource>'."\n";


#Begin of GlobalInformation

print "\t".'<GlobalInformation label="Proposal for Kyoto-internal WordNet representation - Multilingual Central Repository"/>'."\n";

#End of GlobalInformation

#Begin of Lexicon

my $query_languages = $mcr->prepare ("SHOW TABLES LIKE 'wei_".$lang_id."_variant'");
$query_languages->execute ();

while (my ($table) = $query_languages->fetchrow_array ())
{
    my $owner = "ehu";
    my $label = "Automatic genenerated Lexicon for ".$lang_id;
    my ($lang,$version)=split(/-/,$lang_id);
    my $code = $lang_id;

    print "\t".'<Lexicon languageCoding="ISO 639-3" label="'.$label.'" language="'.$lang.'" owner="'.$owner.'" version="'.$version.'">'."\n";
    
    #Begin of LexicalEntry   
    
    my $query_variant = $mcr->prepare ("SELECT word,sense,offset,pos FROM `wei_".$code."_variant` WHERE csco > 49 ORDER BY word,pos,sense");
    $query_variant->execute ();
	
    my $prev_word = "";
    my $prev_pos = "";
    my $lex_entry = "closed";
    
    
    while (my ($word,$sense,$offset,$pos) = $query_variant->fetchrow_array ())
    {
	my $form = $word;
 	$form=~s/\&/\&amp;/g;
 	$form=~s/\"/\&quot;/g;
 	$form=~s/\'/\&apos;/g;
 	$form=~s/\</\&lt;/g;
 	$form=~s/\>/\&gt;/g;
	                                       #   Para recuperar la palabra:
	my @ascii_word = unpack("C*", $word);  #      @ascii_word=split(/\./,$word);
	$word = join(".",@ascii_word);         #      $word = pack("C*", @ascii_word);
                                               

	if ($form eq $prev_word && $pos eq $prev_pos)
	{
	    #Begin of Sense - Sense #2...#n
	    
	    print  "\t\t\t".'<Sense id="S-'.$word.'_'.$pos.'_'.$sense.'" synset="'.$offset.'">'."\n";
	    
	    #Begin of MonolingualExternalRefs
	    
	    my $MER = "\t\t\t\t".'<MonolingualExternalRefs>'."\n";
	    
	    my $AnyMER = 0;
	    
	    my $query_domain = $mcr->prepare ("SELECT domain FROM `wei_".$code."_to_ili` A,`wei_ili_to_domains` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_domain->execute();
	    
	    
	    while (my ($domain) = $query_domain->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="Domain" externalReference="'.$domain.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }			
	    
	    
	    my $query_sumo = $mcr->prepare ("SELECT  SUMO, modif FROM `wei_".$code."_to_ili` A,`wei_ili_to_sumo` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_sumo->execute();
	    
	    while (my ($sumo,$modif) = $query_sumo->fetchrow_array ())
	    {
		my $relType;
		if ($modif eq "=")
		{
		    $relType="equal";
		}
		elsif ($modif eq "+" or $modif eq "=>+")
		{
		    $relType="plus";
		}
		elsif ($modif eq "@")
		{
		    $relType="at";
		}
		else
		{
		    $relType=$modif;
		}
				
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="AdimenSUMO" externalReference="'.$sumo.'" relType="'.$relType.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }
			
			
	    my $query_top = $mcr->prepare ("SELECT top  FROM `wei_".$code."_to_ili` A,`wei_ili_to_to` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_top->execute();
	    
	    while (my ($top) = $query_top->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="TCO" externalReference="'.$top.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }

	    my $query_blc = $mcr->prepare ("SELECT blc  FROM `wei_".$code."_to_ili` A,`wei_ili_to_blc` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_blc->execute();
	    
	    while (my ($blc) = $query_blc->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="BLC" externalReference="'.$blc.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    } 
	    
	    $MER = $MER."\t\t\t\t".'</MonolingualExternalRefs>'."\n";
	    
	    if ($AnyMER == 1)
	    {
		print $MER;
	    }
	    
	    #End of MonolingualExternalRefs
	    
	    print "\t\t\t".'</Sense>'."\n";
			
	    #End of Sense - Sense #2...#n
	}
	else
	{
	    if ($lex_entry eq "opened")
	    {
		print "\t\t".'</LexicalEntry>'."\n";
		
		# End of LexicalEntry
		
	    }
	    
	    print "\t\t".'<LexicalEntry id="LE-'.$word.'_'.$pos.'">'."\n";
	    
	    #Begin of Meta
	    
	    print "\t\t\t".'<Meta author="auto" date="'.$date.'" source="MCR" status=""/>'."\n";
	    
	    #End of Meta
	    
	    #Begin of Lemma
	    
	    print  "\t\t\t".'<Lemma writtenForm="'.$form.'" partOfSpeech="'.$pos.'"/>'."\n";
	    
	    #End of Lemma
	    
	    #Begin of Sense - Sense #1
			
	    print  "\t\t\t".'<Sense id="S-'.$word.'_'.$pos.'_'.$sense.'" synset="'.$offset.'">'."\n";
			
	    #Begin of MonolingualExternalRefs
			
	    my $MER = "\t\t\t\t".'<MonolingualExternalRefs>'."\n";
	    
	    my $AnyMER = 0;
	    
	    
	    my $query_domain = $mcr->prepare ("SELECT domain FROM `wei_".$code."_to_ili` A,`wei_ili_to_domains` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_domain->execute();
	    
	    while (my ($domain) = $query_domain->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="Domain" externalReference="'.$domain.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }			
	    
			
	    my $query_sumo = $mcr->prepare ("SELECT  SUMO, modif FROM `wei_".$code."_to_ili` A,`wei_ili_to_sumo` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_sumo->execute();
	    
	    while (my ($sumo,$modif) = $query_sumo->fetchrow_array ())
	    {
		my $relType;
		if ($modif eq "=")
		{
		    $relType="equal";
		}
		elsif ($modif eq "+" or $modif eq "=>+")
		{
		    $relType="plus";
		}
		elsif ($modif eq "@")
		{
		    $relType="at";
		}
		else
		{
		    $relType=$modif;
		}
		
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="AdimenSUMO" externalReference="'.$sumo.'" relType="'.$relType.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }
			
			
	    my $query_top = $mcr->prepare ("SELECT top  FROM `wei_".$code."_to_ili` A,`wei_ili_to_to` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_top->execute();
	    
	    while (my ($top) = $query_top->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="TCO" externalReference="'.$top.'"/>'."\n";
		$AnyMER = 1;
				
		#End of MonolingualExternalRef
	    }

	    my $query_blc = $mcr->prepare ("SELECT blc  FROM `wei_".$code."_to_ili` A,`wei_ili_to_blc` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	    $query_blc->execute();
	    
	    while (my ($blc) = $query_blc->fetchrow_array ())
	    {
		#Begin of MonolingualExternalRef
		
		$MER = $MER."\t\t\t\t\t".'<MonolingualExternalRef externalSystem="BLC" externalReference="'.$blc.'"/>'."\n";
		$AnyMER = 1;
		
		#End of MonolingualExternalRef
	    }
		
	    $MER = $MER."\t\t\t\t".'</MonolingualExternalRefs>'."\n";
			
	    if ($AnyMER == 1)
	    {
		print $MER;
	    }
	    
	    #End of MonolingualExternalRefs
	    
	    print "\t\t\t".'</Sense>'."\n";
			
	    #End of Sense - Sense #1
	    
	    $prev_word = $form;
	    $prev_pos = $pos;
	    $lex_entry = "opened";
	}
    }
	
    
    if ($lex_entry eq "opened")
    {
	print "\t\t".'</LexicalEntry>'."\n";
	
	# End of LexicalEntry
	
	$lex_entry = "closed";
    }


    my $query_synset = $mcr->prepare ("SELECT A.offset,A.pos,A.gloss,C.bc,C.iliOffset,C.iliPos,C.iliWnId FROM `wei_".$code."_synset` A,`wei_".$code."_to_ili` B,`wei_ili_record` C WHERE A.offset=B.offset AND A.pos=B.pos AND B.iliOffset=C.iliOffset AND B.pos=C.iliPos AND B.iliWnId like C.iliWnId  and (A.offset, A.pos) IN (SELECT D.offset,D.pos FROM `wei_".$code."_variant` D WHERE csco > 49) ORDER BY A.offset,A.pos");
    $query_synset->execute ();
	

    while (my ($offset,$pos,$gloss,$bc,$iliOffset,$iliPos,$iliWnId) = $query_synset->fetchrow_array ())
    {
	#Begin of Synset
	
	print "\t\t".'<Synset id="'.$offset.'" baseConcept="'.($bc*3).'">'."\n";
		
	#Begin of Meta
	
	#End of Meta
	
	#Begin of Definition
		
 	$gloss=~s/\&/\&amp;/g;
 	$gloss=~s/\"/\&quot;/g;
 	$gloss=~s/\'/\&apos;/g;
 	$gloss=~s/\</\&lt;/g;
 	$gloss=~s/\>/\&gt;/g;

	print "\t\t\t".'<Definition gloss="'.$gloss.'">'."\n";
		
	my $query_examples = $mcr->prepare ("SELECT examples FROM `wei_".$code."_examples` WHERE offset='".$offset."' AND pos='".$offset."'");
	$query_examples->execute ();
		
	while (my ($examples) = $query_examples->fetchrow_array ())
	{
	    print "\t\t\t\t".'<Statement example="'.$examples.'"/>'."\n";
	    
	    #End of Statement
	}
		
	print "\t\t\t".'</Definition>'."\n";
		
	#End if Definition
		
	#Begin of SynsetRelations
	
	print "\t\t\t".'<SynsetRelations>'."\n";
	
       	my $query_relations = $mcr->prepare ("SELECT A.targetSynset as tS,A.targetPos as tP,B.name as N FROM `wei_".$code."_relation` A, `wei_relations` B WHERE A.sourceSynset='".$offset."' AND A.sourcePos='".$pos."' AND B.id = A.relation AND A.method not like 'su' AND (A.targetSynset, A.targetPos) IN (SELECT Z.offset,Z.pos FROM `wei_".$code."_variant` Z WHERE csco > 49)");
	$query_relations->execute ();
		

	while (my ($targetSynset,$targetPos,$relation) = $query_relations->fetchrow_array ())
	{
	    #Begin of SynsetRelation
	    
	    print "\t\t\t\t".'<SynsetRelation target="'.$targetSynset.'" relType="'.$relation.'">'."\n";
	    
	    #Begin of Meta
	    
	    #End of Meta
	    
	    print "\t\t\t\t".'</SynsetRelation>'."\n";
	    
	    #End of SynsetRelation
	}
		
	my $query_inverserelations = $mcr->prepare ("SELECT A.sourceSynset as sS, A.sourcePos as sP, B.inverse as N, B.id as Id FROM `wei_".$code."_relation` A, `wei_relations` B WHERE A.targetSynset='".$offset."' AND A.targetPos='".$pos."' AND B.id = A.relation AND A.method not like 'su'  AND (A.sourceSynset, A.sourcePos) IN (SELECT Z.offset,Z.pos FROM `wei_".$code."_variant` Z WHERE csco > 49)");
	
	$query_inverserelations->execute ();

	while (my ($targetSynset,$targetPos,$relation,$id) = $query_inverserelations->fetchrow_array ())
	{
	    if ($relation eq "" || $relation eq "-")
	    {
		my $query_changerelation = $mcr->prepare ("SELECT name FROM `wei_relations` WHERE id =".$id);
		$query_changerelation->execute ();
		
		$relation = $query_changerelation->fetchrow_array ();
	    }
			
	    #Begin of SynsetRelation
	    
	    print "\t\t\t\t".'<SynsetRelation target="'.$targetSynset.'" relType="'.$relation.'">'."\n";
	    
	    #Begin of Meta
	    
	    #End of Meta
			
	    print "\t\t\t\t".'</SynsetRelation>'."\n";
	    
	    #End of SynsetRelation
	}		
	
	
	print "\t\t\t".'</SynsetRelations>'."\n";
	
		
	#End of SynsetRelations
		
	#Begin of MonolingualExternalRefs

	print "\t\t\t".'<MonolingualExternalRefs>'."\n";
		
		
	my $query_domain = $mcr->prepare ("SELECT domain FROM `wei_".$code."_to_ili` A,`wei_ili_to_domains` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	$query_domain->execute();

			
	while (my ($domain) = $query_domain->fetchrow_array ())
	{
	    #Begin of MonolingualExternalRef
	    
	    print  "\t\t\t\t".'<MonolingualExternalRef externalSystem="Domain" externalReference="'.$domain.'"/>'."\n";
	    
	    #End of MonolingualExternalRef
	}			
			
			
	my $query_sumo = $mcr->prepare ("SELECT  SUMO, modif FROM `wei_".$code."_to_ili` A,`wei_ili_to_sumo` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	$query_sumo->execute();
	

		
	while (my ($sumo,$modif) = $query_sumo->fetchrow_array ())
	{
	    my $relType;
	    if ($modif eq "=")
	    {
		$relType="equal";
	    }
	    elsif ($modif eq "+" or $modif eq "=>+")
	    {
		$relType="plus";
	    }
	    elsif ($modif eq "@")
	    {
		$relType="at";
	    }
	    else
	    {
		$relType=$modif;
	    }
				
	    #Begin of MonolingualExternalRef
				
	    print  "\t\t\t\t".'<MonolingualExternalRef externalSystem="AdimenSUMO" externalReference="'.$sumo.'" relType="'.$relType.'"/>'."\n";
				
	    #End of MonolingualExternalRef
	}
			
	
	my $query_top = $mcr->prepare ("SELECT top  FROM `wei_".$code."_to_ili` A,`wei_ili_to_to` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	$query_top->execute();

		
	while (my ($top) = $query_top->fetchrow_array ())
	{
	    #Begin of MonolingualExternalRef
	    
	    print  "\t\t\t\t".'<MonolingualExternalRef externalSystem="TCO" externalReference="'.$top.'"/>'."\n";
	    
	    #End of MonolingualExternalRef
	}

	my $query_blc = $mcr->prepare ("SELECT blc  FROM `wei_".$code."_to_ili` A,`wei_ili_to_blc` B WHERE A.offset='".$offset."' AND A.pos='".$pos."' AND A.iliOffset=B.iliOffset AND A.pos=B.ilipos AND A.iliWnId=B.iliWnId");
	$query_blc->execute();

		
	while (my ($blc) = $query_blc->fetchrow_array ())
	{
	    #Begin of MonolingualExternalRef
	    
	    print  "\t\t\t\t".'<MonolingualExternalRef externalSystem="BLC" externalReference="'.$blc.'"/>'."\n";
	    
	    #End of MonolingualExternalRef
	}
		
	print "\t\t\t".'</MonolingualExternalRefs>'."\n";
	
		
	#End of MonolingualExternalRefs

	print "\t\t".'</Synset>'."\n";
		
	#End of Synset
		
		
	if ($iliOffset ne "")
	{
			
	    push (@{$axis{$iliOffset}}, $offset);
	    
	    my $query_en30 = $mcr->prepare ("SELECT offset,pos FROM `wei_eng-30_to_ili` WHERE iliOffset='".$iliOffset."' AND pos='".$iliPos."' AND iliWnId='".$iliWnId."'");
	    my $cont = $query_en30->execute();
	    
	    if ($cont == 0)
	    {
		push (@{$axis{$iliOffset}}, $offset);
	    }
	    else
	    {
		while (my ($en30offset,$en30pos,$en30iliWnId) = $query_en30->fetchrow_array ())
		{
		    push (@{$axis{$iliOffset}}, $en30offset);
		}
	    }
	    
	}
	else
	{
	    push (@{$axis{$offset}}, $offset);
	}
	
    }


    print "\t".'</Lexicon>'."\n";
}

#End of Lexicon

# Begin of SenseAxes

if ($lang_id ne "eng-30")
{
    print "\t".'<SenseAxes>'."\n";

    my %axis_id;

    foreach my $key (keys %axis)
    {
	my $id = $lang_id;
	$id =~s /[a-z]-//;
	$id = "sa_".$id."-en30";

	my ($iliWnId,$iliOffset,$iliPos) = split(/_/,$key);
	$iliOffset = $key;
		
	if (defined ($axis_id{$id}))
	{
	    $axis_id{$id}++;
	}
	else
	{
	    $axis_id{$id}=001;
	}
	
	$id = $id."_".$axis_id{$id};
	
	#Begin of SenseAxis
	
	print "\t\t".'<SenseAxis id="'.$id.'" relType="equal_synonym">'."\n";
	
	foreach my $element (@{$axis{$key}})
	{
	    #Begin of Target
	    
	    print "\t\t\t".'<Target ID="'.$element.'"/>'."\n";
		
	    #End of Target
	}
	
	
	#Begin of InterlingualExternalRefs
	
	my $IER = "\t\t\t".'<InterlingualExternalRefs>'."\n";
			
	my $AnyIER = 0;


	my $query_domain = $mcr->prepare ("SELECT domain FROM `wei_ili_to_domains` WHERE iliOffset='".$iliOffset."' AND iliPos='".$iliPos."' AND iliWnId='".$iliWnId."'");
	$query_domain->execute();
	
	while (my ($domain) = $query_domain->fetchrow_array ())
	{
	    #Begin of InterlingualExternalRef
		
	    $IER = $IER."\t\t\t\t".'<InterlingualExternalRef externalSystem="Domain" externalReference="'.$domain.'"/>'."\n";
	    $AnyIER = 1;
		
	    #End of InterlingualExternalRef
	
	}			
	
		
	my $query_sumo = $mcr->prepare ("SELECT SUMO,modif FROM `wei_ili_to_sumo` WHERE iliOffset='".$iliOffset."' AND iliPos='".$iliPos."' AND iliWnId='".$iliWnId."'");
	$query_sumo->execute();
	
	while (my ($sumo,$modif) = $query_sumo->fetchrow_array ())
	{
	    my $relType;
	    if ($modif eq "=")
	    {
		$relType="equal";
	    }
	    elsif ($modif eq "+" or $modif eq "=>+")
	    {
		$relType="plus";
	    }
	    elsif ($modif eq "@")
	    {
		$relType="at";
	    }
	    else
	    {
		$relType=$modif;
	    }
		
	    #Begin of InterlingualExternalRef
	    
	    $IER = $IER."\t\t\t\t".'<InterlingualExternalRef externalSystem="AdimenSUMO" externalReference="'.$sumo.'" relType="'.$relType.'"/>'."\n";
	    $AnyIER = 1;
		
	    #End of InterlingualExternalRef
	}
	
	my $query_top = $mcr->prepare ("SELECT top FROM `wei_ili_to_to` WHERE iliOffset='".$iliOffset."' AND iliPos='".$iliPos."' AND iliWnId='".$iliWnId."'");
	$query_top->execute();
	
	while (my ($top) = $query_top->fetchrow_array ())
	{
	    #Begin of InterlingualExternalRef
		
	    $IER = $IER."\t\t\t\t".'<InterlingualExternalRef externalSystem="TCO" externalReference="'.$top.'"/>'."\n";
	    $AnyIER = 1;
		
	    #End of InterlingualExternalRef
	}
	
	$IER = $IER."\t\t\t".'</InterlingualExternalRefs>'."\n";
	
	if ($AnyIER==1)
	{
	    print $IER;
	}
	
	#End of InterlingualExternalRefs
    
	print "\t\t".'</SenseAxis>'."\n";
    
	#End of SenseAxis
    }

    print "\t".'</SenseAxes>'."\n";
}

#End of SenseAxis


print '</LexicalResource>'."\n";

#End of LexicalResource

$mcr->disconnect ();

#End of All
