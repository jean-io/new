#!/bin/bash

touch $1.java
echo "public class $1 extends Object {" > $1.java
echo -e "\n\n" >> $1.java
echo "}" >> $1.java
chmod 644 $1.java
