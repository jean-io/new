#!/bin/bash

touch $1.xml
echo "<?xml version=\"1.0\"?>" > $1.xml
echo "<$1>" >> $1.xml
echo -e "\n\n" >> $1.xml
echo "</$1>" >> $1.xml
chmod 644 $1.xml
