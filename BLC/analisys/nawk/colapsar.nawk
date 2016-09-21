 
BEGIN { prev = ""; line = ""; sum = 0 }

$1 == prev { line = line " " $2
	next
	}

$1 != prev { if (line != "") printf "%s %s\n", prev, line
	line = $2
	prev = $1
	}

END { printf "%s %s\n", prev, line }
