import sys, traceback
import os
from os import walk
import mysql.connector
from mysql.connector import errorcode
from datetime import datetime

cnx_root = None
cursor_root = None

def conn_root():
    global cnx_root
    global cursor_root
    try:
        cnx_root = mysql.connector.connect(user='root',
                password='root',
                host='tssi-db')
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cursor_root = cnx_root.cursor()
        print("Connected as tusi3. Connected: ", str(cnx_root.is_connected()) ,datetime.now())

cnx_tusi = None
cursor_tusi = None

def conn_tusi():
    global cnx_tusi
    global cursor_tusi
    try:
        cnx_tusi = mysql.connector.connect(user='tusi3',
                                password='tusi3-2020',
                                host='tssi-db',
                                database='tusi3')
        
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cursor_tusi = cnx_tusi.cursor()
        print("Connected as tusi3. Connected: ", str(cnx_tusi.is_connected()) ,datetime.now())
    #for x in dir(cnx_tusi):
    #    print('---',x)

# try:
#   cnx = mysql.connector.connect(user='scott',
#                                 database='employ')
# except mysql.connector.Error as err:
#   if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
#     print("Something is wrong with your user name or password")
#   elif err.errno == errorcode.ER_BAD_DB_ERROR:
#     print("Database does not exist")
#   else:
#     print(err)
# else:
#   cnx.close()


tablas = [
    'Ambito','Sector','Provincia','Departamento','Localidad',
    'Escuela','TipoEducacion','NivelEducacion','TipoNivelEducacion',
    'TedNivEscuela','MailTel'
]

metodos = ['get','post','put','delete']

dbfile = 'createdb.sql'
dbuser = 'createuser.sql'

def close_root_db():
    cursor_root.close()
    cnx_root.close
    print("Disconnected as root.", datetime.now())

def close_tusi_db():
    cursor_tusi.close()
    cnx_tusi.close()
    print("Disconnected as tusi.", datetime.now())

def exec_root_sql(sql):
    try:
        for cmd in sql:
            if len(cmd) == 0:
                continue
            cursor_root.execute(cmd)
            # cursor_root.execute(cmd, multi=True)
    except Exception as e:
        print("Error de proceso: ", str(e))
        traceback.print_exc()
        exit(1)

def exec_tusi_sql(sql):
    try:
        for cmd in sql:
            # print(dir(cmd))
            if len(cmd.strip()) == 0:
                continue
            # print(cmd)
            cursor_tusi.execute(cmd)
            # cursor_tusi.execute(cmd + ';', multi=True)
            cnx_tusi.commit()
    except Exception as e:
        print("Error de proceso: ", str(e))
        traceback.print_exc()
        exit(1)

def get_sql(sql):
    # print('Processing ' + sql + ': ' + str(datetime.now()))
    with open(sql, 'r') as d:
        data = d.read()
    return data.split(';')

def create_database():
    exec_root_sql(get_sql(dbfile))

def create_user():
    exec_root_sql(get_sql(dbuser))

def create_datosbase():
    exec_tusi_sql(get_sql('tables/DatosBase.sql'))

def load_datosbase():
    exec_tusi_sql(get_sql('load/loadcsv.sql'))

def create_tables():
    dir_ = 'tables'
    for t in tablas:
        tab = dir_ + '/' + t + '.sql'
        print('Creacion de tabla: ' + t)
        exec_tusi_sql(get_sql(tab))

def load_tables():
    dir_ = 'load'
    for t in tablas:
        ldr = dir_ + '/' + t.lower() + '.sql'
        print('Datos de: ' + t.lower())
        exec_tusi_sql(get_sql(ldr))

def create_procedures():
    dir_ = 'procedures'
    for m in metodos:
        for t in tablas:
            sp = dir_ + '/' + m + '/' + m + t.lower() + '.sql'
            print('SP: ' + m + t.lower())
            exec_tusi_sql(get_sql(sp))

conn_root()
create_database()
create_user()
close_root_db()
conn_tusi()
create_datosbase()
load_datosbase()
create_tables()
load_tables()
create_procedures()
close_tusi_db()
