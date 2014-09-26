#!/bin/sh

touch $1
echo "#!/usr/bin/env ruby" > $1
chmod 755 $1
