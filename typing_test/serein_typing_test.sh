#!/bin/bash

green="\033[32m"
red="\033[31m"
blue="\033[34m"
reset="\033[0m"

words=(
could if she paint her teeth or brush her nails decide should words and the
even difference very use with with between get write read cut exit justify
where next to help out file text is text spell the practice wuick gives brown
is to you power improve control over and your ovrt the lazy and your your dog
fun speed system between face mountain sea but eye home their day near on the
might place night add way ask this sentence users prices his units provides
study who died function customers rate telephone products growth here she
sometimes mom wisdom check was all all did not is back the you not understand
score proepare best place correct complete tool wrong ever never ball sense
it once steel top copy correct never will write search nice drive send red hair
her rise read we file plan time dry with hour hand here
)

while true
do

num=20
test=""

for ((i=0;i<num;i++))
do
index=$((RANDOM % ${#words[@]}))
test="$test ${words[$index]}"
done

test=${test# }

clear
echo -e "${blue} TYPING TEST ${reset}"
echo
echo "$test"
echo

start=$(date +%s)

user_input=""

while true
do

IFS= read -r -s -n1 char

if [[ "$char" == $'\x7f' ]]
then
len=${#user_input}
if [[ $len -gt 0 ]]
then
user_input="${user_input:0:len-1}"
echo -ne "\b \b"
fi
continue
fi

pos=${#user_input}
expected="${test:$pos:1}"

if [[ "$char" == "$expected" ]]
then
echo -ne "${green}$char${reset}"
else
echo -ne "${red}$char${reset}"
fi

user_input="$user_input$char"

if [[ ${#user_input} -ge ${#test} ]]
then
break
fi

done

end=$(date +%s)

minutes=$((end-start))

if [[ $minutes -eq 0 ]]
then
minutes=1
fi

typed=${#user_input}

WPM=$(( typed * 60 / (5 * minutes) ))

match=0

for ((i=0;i<${#test};i++))
do
if [[ "${user_input:i:1}" == "${test:i:1}" ]]
then
match=$((match+1))
fi
done

accuracy=$(( match * 100 / ${#test} ))

echo
echo "Time taken: $minutes seconds"
echo "WPM: $WPM"
echo "Accuracy: $accuracy%"
echo

echo "1) Restart (enter r)"
echo "2) Exit (enter e)"

read choice

if [[ "$choice" == "e" ]]
then
break
fi

done
