#!/bin/bash

touch $1
echo "public class ${1%.*} extends Object {" > $1
echo -e "\n\n" >> $1
echo "}" >> $1
chmod 644 $1
