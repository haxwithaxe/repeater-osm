#!/bin/bash

while getopts "i:n:" opt ;do
	case $opt in
		i)
			infile="$OPTARG"
			;;
		n)
			name="$OPTARG"
			;;
	esac
done

# turn csv downloaded from  http://www.poi-factory.com/node/2227 into "unicsv" format for gpsbabel
awk_exp='BEGIN { print "name,longitude,latitude,location,ref,man_made,operator,source,url,height,ele,communications_transponder:frequency,communications_transponder:tone,communications_transponder:modulation,communications_transponder:access,communications_transponder:service,communications_transponder:polarisation,communications_transponder:power,comment" } { gsub(/[\n\r]/,"",$0);gsub(/\"/,"",$0);split($3,d," ");split($4,c," "); { if (c[2]=="") { callsign=c[1];pltone=""	} else { callsign=c[2]; pltone=c[1] } }; { if (d[3]=="") { offsetval="none" } else if (d[3]=="-"||d[3]=="+") { offsettmp=d[3] } else { offsettmp=d[3]-d[2] }}; { if (offsettmp==0) { offsetval="none" } else if (offsettmp=="-"||offsettmp=="+") { offsetval=d[3] } else { offsetval=offsettmp"MHz" }};location=d[1];freq=d[2];print callsign "," $1 "," $2 ",\""location "\"," callsign ",communications_transponder,,http://www.poi-factory.com/node/2227,,,," freq "," pltone ",NFM,Public,AMATEUR,,,\"offset=" offsetval "\"" }'

awk -F',' "$awk_exp" "$infile" > "$name.csv"

# convert to osm format
# need to lookup how to get gpsbabel to use fields as tags
# gpsbabel -i unicsv -f "$name.csv" -o osm,created_by= -F "$name.osm"

