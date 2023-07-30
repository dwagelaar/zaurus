#!/bin/sh
#
# Creates the `Packages' file necessary for a Zaurus feed.
#
rm Packages 2>/dev/null
NAMES=`ls | grep "\.ipk$" | sed "s/_.*$//g" | sort -u`
for NAME in ${NAMES}; do
  FILE=`ls | grep "^${NAME}.*\.ipk$" | tail -n 1`
  echo "Indexing $FILE..."
  tar xOzf $FILE ./control.tar.gz | tar xOz ./control | grep -v "^$" >> Packages
  echo "Filename: $FILE" >> Packages
  echo "Size: `ls -lL $FILE | sed 's/  */ /g' | cut -d ' ' -f 5`" >> Packages
  echo "MD5Sum: `md5sum $FILE | cut -d ' ' -f 1`" >> Packages
  echo >> Packages
done

#for FILE in `ls | grep \.ipk$`; do
#  echo "Indexing $FILE..."
#  tar xOzf $FILE ./control.tar.gz | tar xOz ./control | grep -v "^$" >> Packages
#  echo "Filename: $FILE" >> Packages
#  echo "Size: `ls -lL $FILE | sed 's/  */ /g' | cut -d ' ' -f 5`" >> Packages
#  echo "MD5Sum: `md5sum $FILE | cut -d ' ' -f 1`" >> Packages
#  echo >> Packages
#done
