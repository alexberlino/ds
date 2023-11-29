#!/bin/bash          
launch() {
echo"$(date)">>sales.txt
for t in ${products[@]}; do
  echo {products[t]}&:& curl http://0.0.0.0:500/${products[t]} >> sales.txt
done
}

