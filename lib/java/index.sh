#!/bin/sh

echo "public class ${1%.*} extends Object {\n\n}" > $1
chmod 644 $1
