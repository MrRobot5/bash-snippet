 
for((i=11;i<=100000;i++));  
do   
	echo $(expr $i \* 3 + 1);  
	cp "全程履约预警字段梳理-0908.xlsx" "全程履约预警字段梳理-"$i".xlsx"
done