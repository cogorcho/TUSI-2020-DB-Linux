#import Config as cfg
import Database as db
import Form as form
import json

if db.status == True:
    #print(db.get_data('getProvincia', -1))
    #print(db.get_data('getProvincia', 24))

    print(db.get_data('getAmbito',-1))
    print(db.get_data('getSector',-1))

    #print("----------------------------------")
    #d = form.get_form('Escuela','POST')
    #print(d)
    #print("----------------------------------")
    #print(json.dumps(d))

else:
    print("No hay conexion a la BD")
