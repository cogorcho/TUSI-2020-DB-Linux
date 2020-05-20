# ---------------------------------------------------------
#
#       Script para test de modulos
#
# ---------------------------------------------------------

import sys
import os
from modulos import *
import modulos.Database as db2
import modulos.Config as cfg
import modulos.Form as form

#cfgdata = config.Config(os.getcwd(),'./config/config.dat')

# Control de parametros
if len(sys.argv) != 2:
    print("No pasaste un argumento del 1 al 12. Chau!")
    sys.exit(1)

arg = sys.argv[1]

#CFG = config.Config(os.getcwd(),'./config/config.dat')
#db = db.DB(CFG)
#pool = db.pool()

def testVersion():
    print(db2.get_version())

def testProvincia():
    print(db2.get_data('getProvincia', -1))
    print(db2.get_data('getProvincia', 24))

def testAmbito():
    print(db2.get_data('getAmbito', -1))

def testSector():
    print(db2.get_data('getSector', -1))

def testTipoEducacion():
    print(db2.get_data('getTipoEducacion', -1))

def testNivelEducacion():
    print(db2.get_data('getNivelEducacion', -1))

def testTipoNivelEducacion():
    print(db2.get_data('getTipoNivelEducacion',-1))

def testLocalidad():
    print(db2.get_data('getLocalPcia',23))

def testDepartamento():
    print(db2.get_data('getDeptPcia',1))

def testEscuela():
    es = '"escuela" : ' + db2.get_data('getEscuelaXId',10404) 
    te = '"ted" : ' + db2.get_data('getEducEscuela',10404) 
    print('{' + es + ',' + te + '}')

def testForm():
    print(form.get_form('Escuela','POST'))
    
def testConfig():
    print(cfg.get_data())

def main(arg):
    if arg == 1:
        testVersion()
    elif arg == 2:
        testProvincia()
    elif arg == 3:
        testAmbito()
    elif arg == 4:
        testSector()
    elif arg == 5:
        testLocalidad()
    elif arg == 6:
        testDepartamento()
    elif arg == 7:
        testEscuela()
    elif arg == 8:
        testTipoEducacion()
    elif arg == 9:
        testNivelEducacion()
    elif arg == 10:
        testTipoNivelEducacion()
    elif arg == 11:
        testConfig()
    elif arg == 12:
        testForm()    
    else:
        print("El argumento es del 1 al 12, GIL!")


if __name__ == '__main__':
    try:
        argu = int(arg)
        main(argu)
        sys.exit(0)
    except Exception as e:
        print(e)
        sys.exit(2)
