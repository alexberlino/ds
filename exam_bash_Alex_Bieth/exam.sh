#!/bin/bash  
call() {

echo $(date) >> sales.txt
products=(rtx3060 rtx3070 rtx3080 rtx3090 rx6700)
for key in "${products[@]}" 
do
  
  echo $key: $(curl "http://0.0.0.0:5000/$key") >> sales.txt
done
}

