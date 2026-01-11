#!/bin/bash

shopt -s dotglob

director="$1"

if [ ! -d "$director" ]; then 
echo "$director nu este un director"
exit 1
fi
ok=1
parcurgere_directoare() {
local director_curent="$1"
for obiect in "$director_curent"/*; do
if [ -d "$obiect" ] && ( [ ! -r "$obiect" ] || [ ! -x "$obiect" ] );then
	echo "$obiect nu are permisiuni de citire sau executare"
	continue
fi
  [ -e "$obiect" ] || [ -L "$obiect" ] ||  continue
 
  if [ -L "$obiect" ]; then
	if [ ! -e "$obiect" ]; then
		echo " $obiect este un broken link"
		ok=0
	fi

  elif  [ -d "$obiect" ] &&  [ ! -L "$obiect" ]; then
     parcurgere_directoare "$obiect"
  fi
done
}
parcurgere_directoare "$director"
if(( ok==1 )); then
echo "Acest director nu are 'broken links'"
fi
