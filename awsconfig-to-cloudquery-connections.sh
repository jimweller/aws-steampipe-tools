#!/bin/sh

# This script takes an aws config file as a parameter.
# Then it transforms it to steampipe aws.spk format.

configfile=$1
rolename=$2

if [ -z $configfile ]; then echo "ERROR: no aws config specified"; exit 1; fi
if [ -z $rolename ]; then echo "ERROR: no aws role specified"; exit 1; fi

# this sed command says only match [profile lines. Then break it up into 3 sections. Print the 2nd section \2. Only print matching lines
for i in `cat $configfile | sed  -E -n  '/\[profile/ s/^(\[profile )(.*\/'"$rolename"')(])$/\2/p'` 
do 

profile=$i
connection=`echo $i | sed -e 's/\/'"$rolename"'//g'`

cat <<EOF 
      - id: "$connection"
        local_profile: "$profile"
EOF
done