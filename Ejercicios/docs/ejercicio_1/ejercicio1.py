import etcd3

# Se crea un cliente y se recupera el valor de una clave denominada var
def recuperarClave():
    etcd = etcd3.client()
    var = etcd.get('var')
    print(var[0])

recuperarClave()