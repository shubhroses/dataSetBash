#!/bin/bash

# Array with folder names
folders=("20221231042035" "20230116042035" "20230201042035" "20230217042035" "20230305042035")

# Loop through array and create each directory
for i in "${folders[@]}"
do
   mkdir ./newWinter/$i
done

