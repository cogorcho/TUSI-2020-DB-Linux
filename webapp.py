from flask import Flask, render_template, jsonify, request
import sys
import os
import logging
import datetime
import modulos.Config as cfg
import modulos.Database as db

app = Flask(__name__)

logfile = "%s/%s-%s.log" % (cfg.get_val('LOGDIR'),datetime.date.today(), __name__)
logging.basicConfig(filename=logfile,format=cfg.get_val('LOGFMT'), datefmt=cfg.get_val('LOGDATEFMT'), level=cfg.get_val('LOGLEVEL'))

@app.route('/')
def home():
    logging.info("Origen: %s" % (request.remote_addr))
    return render_template('index.html')

@app.route('/version')
def version():
    return db.get_version()

@app.route('/provincias')
def provincias():
    return db.get_data('getProvincia', -1)

@app.route('/provincia/<int:id>')
def provincia(id):
    return db.get_data('getProvincia', id)

@app.route('/sectores')
def sectores():
    return db.get_data('getSector', -1)

@app.route('/sector/<int:id>')
def sector(id):
    return db.get_data('getSector', id)

@app.route('/ambitos')
def ambitos():
    return db.get_data('getAmbito', -1)

@app.route('/ambito/<int:id>')
def ambito(id):
    return db.get_data('getAmbito', id)

@app.route('/tiposeducacion')
def tiposeducacion():
    return db.get_data('getTipoEducacion', -1)

@app.route('/tipoeducacion/<int:id>')
def tipoeducacion(id):
    return db.get_data('getTipoEducacion', id)

@app.route('/niveleseducacion')
def niveleseducacion():
    return db.get_data('getNivelEducacion', -1)

@app.route('/niveleducacion/<int:id>')
def niveleducacion(id):
    return db.get_data('getNivelEducacion', id)

@app.route('/tiposniveleseducacion')
def tiposniveleseducacion():
    return db.get_data('getTipoNivelEducacion', -1)

@app.route('/tiponiveleseducacion/<int:id>')
def tiponiveleseducacion(id):
    return db.get_data('getTipoNivelEducacion', id)

@app.route('/escuelasxlocalidad/<int:id>')
def escuelasxlocalidad(id):
    return db.get_data('getEscuelasXLoc', id)

@app.route('/escuela/<int:id>')
def escuelaxid(id):
    es = '{ "escuela" : ' + db.get_data('getEscuelaXId',id) 
    te = ', "ted" : ' + db.get_data('getEducEscuela', id) + '}'
    return (es + te) 

@app.route('/tedescuela/<int:id>')
def tedescuelas(id):
    return db.get_data('getEducEscuela', id) 

@app.route('/localidades/<int:id>')
def localidades(id):
    return db.get_data('getLocalPcia',id)

@app.route('/localidadesxdepto/<int:id>')
def localidadesxdepto(id):
    return db.get_data('getXDepto',id) 

@app.route('/localidad/<int:id>')
def localidad(id):
    return db.get_data('getLocalId', id)

@app.route('/departamentos/<int:id>')
def departamentos(id):
    return db.get_data('getDeptPcia', id)

@app.route('/departamento/<int:id>')
def departamento(id):
    return db.get_data('getDeptId',id)

@app.route('/req')
def req():
    s = 'request.' + 'environ'
    out = "<ul>"
    for r in dir(request):
        if r is not None:
            s = 'request.' + r
            if eval(s) is not None:
                li = "%s: %s" % (r,eval(s))
            out += "<li>%s</li>" % li

    out += "</ul>"
    return out

@app.route('/data/<string:tabla>/', defaults={"id": -1})
@app.route('/data/<string:tabla>/<int:id>')
def data(tabla, id):
    return tabla + ', ' + str(id)
