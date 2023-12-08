#!/bin/bash
​
echo "1: Affichez le nombre d'attributs par document ainsi que l'attribut name. N'affichez que les 12 premières lignes avec la commande head (notebook #2)."
jq '.[] | {name, n_attributes: length}' people.json | head -12
echo "Commande : jq '.[] | {name, n_attributes: length}' people.json | head -12"
echo "Réponse : Il y a toujours 17 attributs"
echo -e "\n---------------------------------\n"
​
echo "2: Combien y a-t-il de valeur "unknown" pour l'attribut "birth_year" ? Utilisez la commande tail afin d'isoler la réponse."
jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}' people.json | tail -4
echo "Commande : jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}' people.json | tail -4"
echo "Réponse : Il y a 4 personnages dont l'attribut birth_year n'est pas renseigné"
echo -e "\n---------------------------------\n"
​
echo "3: Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)."
jq '.[] | (.created / "T")[0], .name' people.json | head -10
echo "Commande : jq '.[] | (.created / "T")[0], .name' people.json | head -10"
echo -e "\n---------------------------------\n"
​
echo "4: Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
jq 'group_by(.birth_year)[] | {id_1: .[0].id, id_2: .[1].id}' people.json
echo "Commande : jq 'group_by(.birth_year)[] | {id_1: .[0].id, id_2: .[1].id}' people.json"
echo -e "Réponse : (1, 5), (4, 11), (6, 36), (43, 51), (21, 62), (32, 52)\nL'attribut birth_year de la pair (8, 19) a pour valeur unkown"
echo -e "\n---------------------------------\n"
​
echo "5: Renvoyez le numéro du premier film dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes."
jq '.[] | (.films[0] / "/")[5], .name' people.json | head -10
echo "Commande : jq '.[] | (.films[0] / "/")[5], .name' people.json | head -10"
echo -e "\n---------------------------------\n"
​
echo -e "----------------BONUS----------------"
​
echo "6: Supprimez les documents lorsque l'attribut height n'est pas un nombre."
jq '.[] | select(.height | test("[0-9]"))' people.json > bonus/people_6.json
echo "Commande : jq '.[] | select(.height | test("[0-9]"))' people.json > bonus/people_6.json"
echo -e "\n---------------------------------\n"
​
echo "7: Transformer l'attribut height en nombre."
jq '.height = (.height | tonumber)' bonus/people_6.json > bonus/people_7.json
echo "Commande : jq '.height = (.height | tonumber)' bonus/people_6.json > bonus/people_7.json"
echo -e "\n---------------------------------\n"
​
echo "8: Ne renvoyez que les personnages dont la taille est entre 156 et 171."
jq 'select(.height < 171 and .height > 156)' bonus/people_7.json > bonus/people_8.json
echo "Commande : "
echo -e "\n---------------------------------\n"
​
echo "9: Renvoyez le plus petit individu de people_8.json et affichez cette phrase en une seule commande : '<nom_du_personnage> is <taille> tall' Renvoyez la commande dans un fichier people_9.txt et non .json."
jq -s -c 'sort_by(.height) | .[0] | .name + " is " +(.height|tostring) + " tall"' bonus/people_8.json > bonus/people_9.txt
echo "Commande : jq -s -c 'sort_by(.height) | .[0] | .name + " is " +(.height|tostring) + " tall"' bonus/people_8.json > bonus/people_9.txt"
echo -e "\n---------------------------------\n"