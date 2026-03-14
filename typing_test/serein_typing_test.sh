#!/bin/bash
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
while true; do
num=20
test=""
for ((i=0;i<num;i++)); do
	index=$((RANDOM % ${#words[@]} ))
	test+=" ${words[$index]}"
	test=${test# }
done
test=${test# }
echo "Start typing"
echo
echo "$test"
echo
start=$(date +%s)
read -r user_input
end=$(date +%s)
minutes=$(( end - start))
typed=${#user_input} 
WPM=$(( typed * 60 / (5 * minutes) ))
match=0
for ((i=0; i<${#test}; i++)); do
	if [[ "${user_input:i:1}" == "${test:i:1}" ]]; then
		((match++))
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
if [[ $choice == "e" ]]; then
	break
fi
done

