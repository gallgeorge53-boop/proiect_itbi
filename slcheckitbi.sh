#!/bin/bash

director="$1"

if [ ! -d "$director" ]; then 
echo "$director nu este un director"
exit 1
fi

parcurgere_directoare() {
local director_curent="$1"
for obiect in "$director_curent"/*; do
  [ -e "$obiect" ] || [ -L "$obiect"] ||  continue 
   if [ -L "$obiect" ]; then
	if [ ! -e "$obiect" ]; then
		echo " $obiect este un broken link"
	fi

  elif  [ -d "$obiect" ] &&  [ ! -L "$obiect" ]; then
     parcurgere_directoare "$obiect"
  fi
done
}
parcurgere_directoare "$director"
