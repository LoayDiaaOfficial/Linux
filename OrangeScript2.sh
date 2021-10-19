#!/bin/sh

echo "Please Enter the contract ID"

read contract_ID

#grep -h -B10 "\\<$customer_ID\\>" /home/loaydiaa/Desktop/Prod_log_triple.txt 
 
#awk "BEGIN{ c=0 } // {c++ } END{print \"we stopped at line:\",c}" customer

number=$( awk "BEGIN{count=0}/$contract_ID/ {print;print \"Number of lines:\",NR;count++;if(count>=100)exit}" /home/loaydiaa/Desktop/Prod_log_triple.txt  | tail -n 1 | grep -o '[[:digit:]]*' )
firstRow=$(head -n $number /home/loaydiaa/Desktop/Prod_log_triple.txt | tac | awk 'BEGIN{count=0}/======/{print NR;count++;if(count>=1)exit}') 
echo $number
#number= $( "$catchPhrase"| tail -n 1 | grep -o [[:digit:]]*)
firstRow=$((firstRow-1)) 
firstRow=$((number-firstRow))


#echo $firstRow

numberHead=$(awk  "BEGIN{count=0} /======/  {if(NR>$number){count++;print NR;if(count>=1)exit}} " /home/loaydiaa/Desktop/Prod_log_triple.txt ) 
echo $numberHead 
difference=$((numberHead-firstRow+1))


head -n $numberHead /home/loaydiaa/Desktop/Prod_log_triple.txt | tail -n $difference 
