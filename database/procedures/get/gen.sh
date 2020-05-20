for i in MailTel
do
f=`echo get$i.sql | tr [A-Z] [a-z]`
sp=`echo get$i | tr [a-z] [A-Z]`
echo "DELIMITER //" > $f
echo "" >> $f
echo "DROP IF EXISTS $sp;" >> $f
echo "" >> $f
echo "CREATE PROCEDURE $sp(IN EID INT)" >> $f

echo 'BEGIN' >> $f
echo "    SELECT" >> $f
cnt=1
mysql -u tusi2 -ptusi2-2020 tusi2 --skip-column-names -B -e "call curdemo('$i')" 2>/dev/null | while read cn dt cl  
do
    if [ $cnt -eq 1 ]
    then
        cnt=2
        echo '        '$cn  >> $f
    else
        echo '        ,'$cn  >> $f
    fi
done
echo '    FROM $i' >> $f
echo '    WHERE ID = EID;'  >> $f
echo "END; //" >> $f
echo "" >> $f
echo "DELIMITER ;" >> $f
done