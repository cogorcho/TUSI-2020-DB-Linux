for i in `cat /tmp/tablas.txt`
do
fl=`echo delete$i.sql | tr [A-Z] [a-z]`
sp=`echo delete$i | tr [a-z] [A-Z]`
echo $i $sp 
echo "DELIMITER //" > $fl
echo "" >> $fl
echo "DROP PROCEDURE IF EXISTS $sp;" >> $fl
echo "" >> $fl
echo "CREATE PROCEDURE $sp(pkdi INT)" >> $fl
echo "BEGIN" >> $fl
echo "   DELETE FROM $i WHERE ID = pkid;" >> $fl
echo "END //" >> $fl
echo "" >> $fl
echo "DELIMITER ;" >> $fl

done
