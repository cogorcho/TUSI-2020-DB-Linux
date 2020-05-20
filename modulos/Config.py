import os

cfgfile = ""
cfg = {}

def checkcfgdir(_dir, _file):
    global cfgfile

    if not os.path.exists(_dir):
        print("No existe el directorio %s" % (_dir))
        return False

    if not os.path.exists(_dir + '/' + _file):
        print("No existe el archivo %s" % (_dir + '/' + _file))
        return False
    
    cfgfile = _dir + '/' + _file
    return True

def get_data():
    global cfg
    with open(cfgfile) as f:
        for line in f:
            (key, val) = line.split(':')
            cfg[key] = val.strip('\n')
    f.close()
    return cfg

def get_val(k):
    return cfg[k]


def leer_config():
    #print('Config.leer_config',__name__)
    if checkcfgdir(os.getcwd(),'./config/config.dat'):
        get_data()

leer_config()