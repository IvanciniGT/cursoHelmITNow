Instalacion Kubernetes

helm
    charts existian en repositorios

Chart X version vX -> sirve para instalar ->  app Y vY
    values.yaml

$ helm repo add NOMBRE_REPO_MIO URL
$ helm pull NOMBRE_REPO_MIO/chart

helm install ..... >
    Crea muchassssss cosas

helm uninstall 
    Borrar muchaass también . Las que creo.
        pvc ¿?¿?¿?¿?¿
        secret AUTO Claves autogeneradas

quien crea un pv?
    - Admin
    - Provisionador dinamico


MariaDB
    Secret Contraseña ROOT < aleatoria
      - Creo los ficheros de BBDD
reinstalacion con una version nueva del chart
Copio los volumenes y a no funcionar 


Para que sirve? Affinity:
    Dar pistas al scheduller sobre donde ubicar un POD
        Afinidad a nivel de Nodo     ****
        Afinidad a nivel de POD
        Antiafinidad a nivel de POD  **********
            preferredDuringSchedulingIgnoredDuringExecution
                intenta no poner un mariadb donde haya un mariadb.  : soft
            requiredDuringSchedulingIgnoredDuringExecution
                ni de coña pongas un mariadb donde haya un mariadb. : hard
            
            
            soft or hard son términos de quién? BITNAMI
    

Donde podemos dentro de Kubernetes controlar los recursos que se usan por las cosas que se instalan:
    namespace:
        ResourceQuota
            Controlar el limite de recursos a utilizar entre todas las cosas que se creen en un ns
        LimitRange
            Controlar el limite de recursos a utilizar por cada pod o contenedor que se creen en un ns
            Controlar el minimo garantizado de recursos a utilizar por cada pod o contenedor que se creen en un ns
        
        POD/Plantilla de POD:
            Controlar el limite de recursos del pod/contenedor
                -> Si kubernetes tiene hueco (el nodo) le permite usar más.
                -> Si en un momento dado kubernetes necesita esos recursos por haber comprometido con otro despliegue?
                    -> CPU: me cierra el grifo. Vas mas lento
                    -> Memoria: Reinicia el pod.   kill -15 SIGTERM .... kill -9 SIGKILL
            Controlar el minimo garantizado de recursos del pod/contenedor
                -> No se hace scheduling si el nodo no tiene recursos suficientes disponibles
                -> HorizontalPodAutoscaler
                        CPU        40%
                        Memory     30%   300Mi/800Mi

PRUEBAS SOBRE UN POD:
    startupProbe:       Esta levantado el servicio
        ps   -> FALLA?   Reinicia el pod
                BIEN?    Hace prueba de liveness
    livenessProbe:      Que el pod responde
        ps   -> Falla?   Reinicia el pod
                bien?    Prueba de readyness
    readinessProbe:     Si el servicio funciona correctamente
        ps   -> Falla?   Se saca el pod del backend del servicio asociado
                bien?    Lo enchufo al servicio
Si no pongo nada... que hace kubernetes?
    - Mira si el proceso 1 del contenedor (el que se lanza con el commando del contenedor) esta vivo
            ps 
            
        MariaDB
            startup? ps o el puerto
            lifeness? Esta todo corriendo pero en modo admin porque estamos con la 
                      BBDD congelelada en medio de un backup
            readyness? que me puedo conectar al puerto de mariaDB con un usuario y hacer query

MariaDB 2 replicas:

Nodo 1
Nodo 2
    pod mariadb1:  4Gbs y 2 cpu.    
Nodo 3
    pod mariadb2:  4Gbs y 2 cpu
Nodo 4
Nodo 5

Scheduler es quien decide donde ubicar los pods



helm install NOMBRE_VUESTRO repo/chart -f values.yaml --dry-run --namespace ivan --create-namespace



