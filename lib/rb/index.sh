#!/bin/bash

touch $1.rb
echo "#!/usr/bin/env ruby" > $1.rb
chmod 755 $1.rb
