import modulos.Database as db

dict_out = {}

def get_form(tabla, metodo):
    dict_out["tabla"] = tabla
    dict_out["metodo"] = metodo

    campos = []
    for r in db.get_cursor_description(tabla):
        campo = {}
        campo['nombre'] = r['nombre']
        campo['tipo'] = r['tipo'].replace('VAR_','').lower()

        if 'NOT_NULL' in r['flags']:
            campo['required'] = 'required'

        if 'PRI_KEY' in r['flags']:
            campo['hidden'] = "hidden"
        
        if 'MULTIPLE_KEY' in r['flags']:
            fktabla = r['nombre'].replace('id','',1)
            campo['fktabla'] = fktabla
            campo['data'] = db.get_combo_data(fktabla)

        campos.append(campo)
    dict_out["campos"] = campos
  

    return dict_out
