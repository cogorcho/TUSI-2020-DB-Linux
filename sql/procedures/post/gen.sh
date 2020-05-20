for i in `cat /tmp/tablas.txt`
do
f=`echo post$i,sql | tr [A-Z] [a-z]`
sp=`echo post$i | tr [a-z] [A-Z]`
echo "DELIMITER //" > $f
echo "" >> $f
echo "DROP IF EXISTS $sp;" >> $f
echo "" >> $f
echo "CREATE PROCEDURE $sp(" >> $f

cnt=1
mysql -u tusi2 -ptusi2-2020 tusi2 --skip-column-names -B -e "call curdemo('$i')" 2>/dev/null | while read cn dt cl  
do
    if [ $cn == "id" ]
    then
        continue
    fi
    if [ $dt == "VARCHAR" ]
    then
        if [ $cnt -eq 1 ]
        then
            echo '    p'$cn $dt\($cl\) >> $f
            cnt=2
        else
            echo '    ,p'$cn $dt\($cl\) >> $f
        fi
    else
        if [ $cnt -eq 1 ]
        then
            cnt=2
            echo '    p'$cn $dt >> $f
        else
            echo '    ,p'$cn $dt >> $f
        fi
    fi
done
echo  "    ,OUT out_id INT)" >> $f
echo 'BEGIN' >> $f
echo "    INSERT INTO ${i} (" >> $f
cnt=1
mysql -u tusi2 -ptusi2-2020 tusi2 --skip-column-names -B -e "call curdemo('$i')" 2>/dev/null | while read cn dt cl  
do
    if [ $cn == "id" ]
    then
        continue
    fi
    if [ $cnt -eq 1 ]
    then
        cnt=2
        echo '        '$cn  >> $f
    else
        echo '        ,'$cn  >> $f
    fi
done
echo '    ) VALUES (' >> $f
mysql -u tusi2 -ptusi2-2020 tusi2 --skip-column-names -B -e "call curdemo('$i')" 2>/dev/null | while read cn dt cl  
do
    if [ $cn == "id" ]
    then
        continue
    fi
    if [ $cnt -eq 1 ]
    then
        cnt=2
        echo "        p${cn}"  >> $f
    else
        echo "        ,p${cn}"  >> $f
    fi
done
echo '    );' >> $f
echo "" >> $f
echo "    SELECT **id** as **out_id**" >> $f
echo "    FROM **$i** LAST_INSERT_ID();" >> $f
echo "END; //" >> $f
echo "" >> $f
echo "DELIMITER ;" >> $f
done