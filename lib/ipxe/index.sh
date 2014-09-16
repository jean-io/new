#!/bin/bash

touch $1.ipxe
echo "#!ipxe" > $1.ipxe
chmod 644 $1.ipxe
