# Creacion de la base de datos (linux)

Proyecto integrando Bases de Datos (mysql) y programacion avanzada (python)de la Tecnitatura Superior en 
Sistemas Informaticos (TUSI) de la Regional San Nicolas de la UTN.

## Creacion de la base de datos y usuario
## Carga de datos base
## Creacion de tablas, vistas y procedimientos almacenados
## Generacion de datos

# Script de creacion: createdb.sh

#!/bin/bash
#-------------------------------------#
#
# Creacion de la BD del proyecto
#
#-------------------------------------#

FECHA=`date +"%Y%m%d%H%M%S"`
LOGFILE="crdb_$[FECHA].log"

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Crear Base: ${TIEMPO}"
mysql -u root -pneheik <<EOF 2>$LOGFILE
source createdb.sql
source createuser.sql
EOF

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Datos base: ${TIEMPO}" 
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF2 2>>$LOGFILE
source datosbase.sql
EOF2

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Crear tablas: ${TIEMPO}"
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF3 2>>$LOGFILE
source tables/Provincia.sql
source tables/Ambito.sql
source tables/Sector.sql
source tables/Departamento.sql
source tables/Localidad.sql
source tables/Escuela.sql
source tables/MailTel.sql
source tables/TipoEducacion.sql
source tables/NivelEducacion.sql
source tables/TipoNivelEducacion.sql
source tables/TedNivEscuela.sql
EOF3

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Crear views: ${TIEMPO}"
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF4 2>>$LOGFILE
source views/adultos.sql
source views/arte.sql
source views/bilingue.sql
source views/comun.sql
source views/encierro.sql
source views/especial.sql
source views/hospital.sql
source views/servicios.sql
EOF4

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Carga de datos: ${TIEMPO}"
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF5 2>>$LOGFILE
source load/ambito.sql
source load/sector.sql
source load/provincia.sql
source load/departamento.sql
source load/localidad.sql
source load/escuela.sql
source load/mailtel.sql
source load/niveleducacion.sql
source load/tipoeducacion.sql
source load/tiponiveleducacion.sql
source load/tednivescuela.sql
EOF5

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Crear Procedures: ${TIEMPO}"
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF6 2>>$LOGFILE
source procedures/delete/deleteambito.sql
source procedures/delete/deletedepartamento.sql
source procedures/delete/deleteescuela.sql
source procedures/delete/deletelocalidad.sql
source procedures/delete/deletemailtel.sql
source procedures/delete/deleteniveleducacion.sql
source procedures/delete/deleteprovincia.sql
source procedures/delete/deletesector.sql
source procedures/delete/deleteservicios.sql
source procedures/delete/deletetednivescuela.sql
source procedures/delete/deletetipoeducacion.sql
source procedures/delete/deletetiponiveleducacion.sql
source procedures/get/getambito.sql
source procedures/get/getdepartamento.sql
source procedures/get/geteducescuela.sql
source procedures/get/getescuela.sql
source procedures/get/getlocalidad.sql
source procedures/get/getniveleducacion.sql
source procedures/get/getprovincia.sql
source procedures/get/getsector.sql
source procedures/get/getsesiones.sql
source procedures/get/gettablecolumns.sql
source procedures/get/gettables.sql
source procedures/get/gettipoeducacion.sql
source procedures/get/gettiponiveleducacion.sql
source procedures/get/getviews.sql
source procedures/post/postambito.sql
source procedures/post/postdepartamento.sql
source procedures/post/postescuela.sql
source procedures/post/postlocalidad.sql
source procedures/post/postmailtel.sql
source procedures/post/postniveleducacion.sql
source procedures/post/postprovincia.sql
source procedures/post/postsector.sql
source procedures/post/postservicios.sql
source procedures/post/posttednivescuela.sql
source procedures/post/posttipoeducacion.sql
source procedures/post/posttiponiveleducacion.sql
source procedures/put/putambito.sql
source procedures/put/putdepartamento.sql
source procedures/put/putescuela.sql
source procedures/put/putlocalidad.sql
source procedures/put/putmailtel.sql
source procedures/put/putniveleducacion.sql
source procedures/put/putprovincia.sql
source procedures/put/putsector.sql
source procedures/put/putservicios.sql
source procedures/put/puttednivescuela.sql
source procedures/put/puttipoeducacion.sql
source procedures/put/puttiponiveleducacion.sql
EOF6


TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Control de datos: ${TIEMPO}"
mysql -u tusi3 -ptusi3-2020 tusi3 <<EOF7 2>>$LOGFILE
select count(*) as Ambto from Ambito        ;
select count(*) as Sector from Sector        ;
select count(*) as Provincia from Provincia     ;
select count(*) as Departamento from Departamento  ;
select count(*) as Localidad from Localidad     ;
select count(*) as Escuela from Escuela       ;
select count(*) as MailTel from MailTel       ;
select count(*) as TipoEducacion from TipoEducacion ;
select count(*) as NivelEducacion from NivelEducacion;
select count(*) as TipoNivelEducacion from TipoNivelEducacion;
select count(*) as TedNIvelEscuela from TedNivEscuela ;
EOF7

TIEMPO=`date +"%Y-%m-%d-%H:%M:%S"`
echo "Listo: ${TIEMPO}"

