#!/bin/bash/

director="$1"

if [ ! -d "$director" ]; then 
echo "$director nu este un director"
exit 1
fi
