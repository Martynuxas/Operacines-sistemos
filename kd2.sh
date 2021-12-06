#!/bin/sh
# 1. Darydamas uzduotis naudojuosi tik LD1 ir LD2 aprasais,
#    sistemos pagalbos sistema (man ir pan.), savo darytomis LD uzduotimis
# 2. Užduoti darau savarankiškai be treciuju asmenu pagalbos
# 3. Uzduoti koreguoju naudodamasis vienu kompiuteriu
#
# Vardas? Pavarde? AR_SUTINKAT?
# Martynas Kemezys SUTINKU

[ $# -eq 2 ] || exit 255

A=$1
B=$2

grep 'Failed password for' studlog | awk -F 'from | port' '{print $2}' | sort uniq -c | sort | awk "\$1 > $A && \$1 < $B"

grep 'Failed password for' studlog | awk -F 'from | port' '{print $2}' | sort | uniq > ips

grep -Fp ips studlog | grep 'Failed password for' | grep -v '<invalid username>' | awk -F 'for | from' '{print $2}' | sort | uniq
