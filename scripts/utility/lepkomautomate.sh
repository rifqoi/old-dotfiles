#!/bin/sh

for FILE in *.zip
do
        if ! [ -f "$FILE" ] 
        then
          echo "No zip files exist"
        else
          unzip *Act*.zip  &&
          # unzip $1*  &&
          sleep 5 &&
          find . -iname 'Pert*.pdf' -exec mv {} . \;
          find /windows10/D/Gunadarma/Lepkom/Aslab/PTA2021 -type d 2>/dev/null | fzf | xargs -I '{}' mv -v *.pdf {} &&
          rm -r Part* *.zip 
       fi
       break
     done
