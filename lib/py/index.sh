#!/bin/sh

touch $1
echo "#!/usr/bin/env python" > $1
chmod 755 $1
