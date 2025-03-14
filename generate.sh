#!/bin/bash

# Define character sets
alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Start HTML file
cat <<'EOF' > index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Random Addresses</title>
  <style>
    table { border-collapse: collapse; width: 100%; }
    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
  </style>
</head>
<body>
<h1>Random Addresses</h1>
<table>
  <tr>
    <th>NAME</th>
    <th>ADDRESS</th>
    <th>POSTAL</th>
    <th>CITY</th>
  </tr>
EOF

# Array definitions for generating random names and addresses
f1=("Ja" "Jo" "Wi" "He" "Thi" "Ge" "Pe" "Ruu" "Da" "Ma" "Baa" "Flo" "Kla" "Die" "Nie" "Sja" "Kie" "Pie" "Rie" "Tru" "Fie" "Gie" "Mie" "Sie" "Wie" "Zie")
f2=("n" "han" "llem" "ndrik" "js" "rrit" "ter" "d" "arten" "rt" "as" "ris" "derik" "ls" "p" "k" "tje" "sje" "mie" "fie" "kie" "pie" "rie" "sie" "tje" "wie")
pre=("van " "de " "van der " "van den " "van de " "ter " "den " "te " "" "" "" "" "van het " "op de " "uit de " "aan de ")
l1=("Krom" "Flap" "Snor" "Plomp" "Knobbel" "Kakel" "Poffer" "Wafel" "Slinger" "Bagger" "Klont" "Snoek" "Pulk" "Klep" "Brok" "Droef" "Klets" "Slof" "Kwak" "Drol" "Snot" "Pluis" "Klets" "Kwast" "Pruik" "Sluik")
l2=("neus" "zak" "baard" "kont" "teen" "bek" "tje" "koek" "drol" "bult" "klomp" "scheur" "snor" "poot" "krent" "lap" "vlerk" "kous" "broek" "flap" "dweil" "pluis" "kwab" "kwast" "pluim" "drab")
s1=("Scheve" "Kromme" "Wankele" "Stink" "Platte" "Bagger" "Soppe" "Kakel" "Knipper" "Flubber" "Snoeze" "Poffer" "Klots" "Wafel" "Piskijk" "Droge" "Natte" "Zompige" "Kleverige" "Slijmerige" "Krakende" "Ratte" "Muffe" "Stoffige" "Kleverige" "Zompige")
s2=("steeg" "gracht" "sloot" "dijk" "kade" "wal" "pad" "gang" "laantje" "wegje" "bult" "kuil" "poel" "brug" "vlonder" "dreef" "vaart" "vliet" "plas" "singel" "weide" "hoek" "laan" "straat" "dijkje" "weg")
c1=("Kloo" "Breu" "Vlier" "Nes" "Dron" "Grui" "Spaa" "Zwad" "Hels" "Bron" "Vliet" "Kraa" "Smit" "Tuin" "Ruig" "Droef" "Klets" "Slof" "Kwak" "Drol" "Snot" "Pluis" "Klets" "Kwast" "Pruik" "Sluik")
c2=("dorp" "veld" "burg" "kerk" "broek" "wijk" "zaan" "hoven" "buren" "schede" "stein" "ingen" "donk" "poort" "woude" "hoek" "veer" "dam" "meer" "zijl" "gat" "bos" "heuvel" "duin" "plas" "vaart")

# Generate 100 random addresses
for i in {1..100}; do
  first="${f1[$((RANDOM % ${#f1[@]}))]}${f2[$((RANDOM % ${#f2[@]}))]}"
  last="${pre[$((RANDOM % ${#pre[@]}))]}${l1[$((RANDOM % ${#l1[@]}))]}${l2[$((RANDOM % ${#l2[@]}))]}"
  street="${s1[$((RANDOM % ${#s1[@]}))]}${s2[$((RANDOM % ${#s2[@]}))]} $((RANDOM % 200))"
  city="${c1[$((RANDOM % ${#c1[@]}))]}${c2[$((RANDOM % ${#c2[@]}))]}"
  postal="$(printf "%04d" $((1000 + RANDOM % 9000)))${alphabet:$((RANDOM % 26)):1}${alphabet:$((RANDOM % 26)):1}"

  printf "<tr><td>%s %s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n" "$first" "$last" "$street" "$postal" "$city" >> index.html
done

# End HTML file
cat <<'EOF' >> index.html
</table>
</body>
</html>
EOF
