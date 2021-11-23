# HELM

+++ Gestionar el ciclo de vida de los despliegues en Kubernetes
Parametrizar los archivos de despliegue. <<<<<   Kustomize

Chart < Plantilla de despliegue
Donde están? Repositorios: Oficiales
                           Privados
                           Publicos no oficiales
                          
                        Carpeta compartida por http
                        Repo git
                        
Cuando lo usamos, como lo personalizo (mi despliegue):
    - Variables que puedo suministrar mediante linea de comandos
    - Variables que puedo suministrar mediante un fichero de parametros
    - O ambos...
    - Y muchos de ellos
    
helm repo add ....
helm template chart > VER EL FICHERO DE DESPLIEGUE DE KUBERNETES QUE SE APLICARÍA
helm install
helm upgrade
helm uninstall

BBDD
    MariaDB... 
    
???

namespace
despliegue > StatefulSet , Deployment , DaemonSet. > POD > Containers (service, daemon)
    credenciales > secret
    volumenes > pvclaim
                pv
servicio
ServiceAccount > Cuenta que usa el POD para comunicarse con el Cluster (monitorización)

Cronjob > JOB > Containers (scripts) : Cargas de datos... backup


StatefulSet: Plantilla de POD + numero de replicas + plantilla de pvc. Cada pod tendrá su propio PVC 
             cada pod tendrá su propio volumen.
    Toto aquello que almacene datos, es un stafulset
        BBDD, Gestos de colas (KAFKA), Indexador (ES)
Deployment:  Plantilla de POD + numero de replicas > PODs que comparten VOLUMENES
DaemonSet:   Plantilla de Pod. Kub monta un POD en cada nodo (cosas de base/infra)



YAML es un lenguaje de marcado de información de proposito general 
JSON
XML


HTML: es un lenguaje de marcado de proposito especifico HTML

storageClass: Definir el tipo de Almacenamiento:
    Es obligatorio? NO, siempre que no utilice un provisionador dinamico de volumenes.

Qué es un provisionador dinámico de volumenes?
pvc ----  Programa que será mi provisionador que 
            en un pod dentro de kubernetes
          y si el pvc es del mismo storageClass que el definido por el provisionador
          y entonces crea un pv
          
Imaginad que mi chart crea:
    Deployment
    PVC > Storageclass. QUIERO QUE MI CHART CREE UN PVC???? NO (salvo alguna excepción)
                        Por qué? porque si un dia desinstalo el chart, pierdo el pvc.
    Service
    Secret
    ConfigMap

Para que sirve un pvc?
    Para que quiero hacer una petición de un volumen que necesito?

---

cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata: 
    name: mi-deployment
spec:
    replicas: 2
    
    selector:
        matchLabels:
            milabel: mivalor
    
    template:
        metadata:
            labels:
                milabel: mivalor
        spec:
            volumes:
                - name: datos
                  hostPath:
                    type: DirectoryOrCreate
                    path: /home/ubuntu/environment/datos/nginx
                  #nfs:
                  #  server: mi-servidor-nfs
                  #  path:   /exportada/datos/nginx
                    
            containers:
                - image: nginx
                  name: contenedor1
                  volumeMounts:
                    - name: datos
                      mountPath: /misDatos
EOF