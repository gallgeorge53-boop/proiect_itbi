#!/bin/bash

director="$1"

if [ ! -d "$director" ]; then 
echo "$director nu este un director"
exit 1
fi

parcurgere_directoare() {
director_curent="$1"
for obiect in "director_curent"/*; do
  [ -e "$obiect" ] || continue 

  if  [-d "$obiect" ]; then
     parcurgere_directoare "$obiect"
  fi
done
}
