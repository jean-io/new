#!/bin/bash

touch $1.py
echo "#!/usr/bin/env python" > $1.py
chmod 755 $1.py
