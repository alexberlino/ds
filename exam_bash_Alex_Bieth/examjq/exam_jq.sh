#!/bin/bash

number=$(jq length people.json)
people=$(jq '.[] | .name' people.json)

sudo apt-get install jq

echo "1. Question statement 1: number of arguments">> res_jq.txt
echo "Number of people in the people.json: $number">> res_jq.txt
#echo "People names: $people"




nb_unknown=$jq '.[] | select(.birth_year=="unknown")| add' people.json


echo '[{"username":"user1"},{"username":"user2"}]' | jq '. | length'
echo "2. Question statement 2: Unknow date of birth">> res_jq.txt
echo "Number of unknowns: $nb_unknown" >> res_jq.txt


echo "3. Question statement 3: each character's creation date and name.">> res_jq.txt
echo "Command: <command to respond>">> res_jq.txt
echo "Answer: answer question 1 if asked">> res_jq.txt




echo "4. Question statement 4:  characters are born at the same time">> res_jq.txt
echo "Command: <command to respond>"
echo "Answer: answer question 1 if asked"




echo "5. Question statement 5">> res_jq.txt
echo "Command: <command to respond>"
echo "Answer: answer question 1 if asked"