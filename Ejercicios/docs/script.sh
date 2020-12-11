ETCD_VER=v3.4.14

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

# Limpiamos instalaciones anteriores
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

# Descargamos y descomprimimos el paquete en la ruta especificada
curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

# Comprobamos que está correctamente instalado
/tmp/etcd-download-test/etcd --version
/tmp/etcd-download-test/etcdctl version

# Se cambian los ejecutables de carpeta para que no sea necesario poner la ruta entera
# Requiere de permisos de superusuario
mv /tmp/etcd-download-test/etcd /usr/local/bin/
mv /tmp/etcd-download-test/etcdctl /usr/local/bin/