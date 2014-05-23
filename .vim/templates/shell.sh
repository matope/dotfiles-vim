#!/bin/sh

echo "===== loop with counter ====="
MAX=10
for i in `seq 1 $MAX`
do
  echo "$i"
done

echo "===== loop with list ====="
for var in `ls -1 ~/`
do
  echo $var
done
