for i in `cat /tmp/tablas.txt`
do
f=`echo put$i,sql | tr [A-Z] [a-z]`
sp=`echo put$i | tr [a-z] [A-Z]`
echo "DELIMITER //" > $f
echo "" >> $f
echo "DROP IF EXISTS $sp;" >> $f
echo "" >> $f
echo "CREATE PROCEDURE $sp(" >> $f

cnt=1
mysql -u tusi2 -ptusi2-2020 tusi2 --skip-column-names -B -e "call curdemo('$i')" 2>/dev/null | while read cn dt cl  
do
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
echo  ")" >> $f
echo 'BEGIN' >> $f
echo "    UPDATE ${i} SET" >> $f
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
        echo "         ${cn} = ifnull(p${cn}, ${cn})"  >> $f
    else
        echo "        ,${cn} = ifnull(p${cn}, ${cn})"  >> $f
    fi
done
echo '    WHERE ID = pID;' >> $f
echo "" >> $f
echo "END; //" >> $f
echo "" >> $f
echo "DELIMITER ;" >> $f
done