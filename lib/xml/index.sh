#!/bin/bash

touch $1
echo "<?xml version=\"1.0\"?>" > $1
echo "<$1>" >> $1
echo -e "\n\n" >> $1
echo "</$1>" >> $1
chmod 644 $1
