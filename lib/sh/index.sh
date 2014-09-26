#!/bin/sh

touch $1
echo "#!/bin/sh" > $1
chmod 755 $1
