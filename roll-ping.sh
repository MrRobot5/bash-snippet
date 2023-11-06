
i=1
while ((i <= 10))
do
    ping c.biancheng.net
    ((i++))
	echo "The i is: $i"
    sleep $((RANDOM % 30))m
done


