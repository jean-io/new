#!/bin/bash

touch $1.ipxe
echo "#!ipxe" > $1
chmod 644 $1
