ElasticSearch

Monitorización Beats + Kafka + Logstash + Logstash + ElasticSearch + Kibana

WP - Cluster
    Wp1
    Wp2

ES - Cluster
    es01 - master (2+1)
            activo pasivo + voto
    es02 - data (muchos con un minimo de 2)
    es03 - coordinators Ninguno -> data 
    es04 - ingest       Ninguno -> data 
    kibana - 1
    
    es... cada nodo que es? un deployment, un daemonset o un statefulset? STATEFULSET
    

STATEFULSET = DEPLOYMENT +
    - Plantillas de PVC 
    - Servicios para cada nodo
    
    
deployment : wordpress                  
    wp1                     >           service: wp 
    wp2

statefulset elasticsearch
    -maestro1                >           maestro1.maestros   maestro2.maestros
    -maestro2
    -data1
    -data2
    ingesta1                >           ingesta      (CARGAR DATOS)     
    ingesta2                >
    coordinador1                >       coordinacion (CONSULTA DE DATOS)
    coordinador2                >
    
    kibana
    
    
    Comunicación: UNICAST
    Cuando un nodo se presenta a otro nodo, el segundo le presenta a su vez al primero a tudos sus amiguitos.
    
    Al configurar cada nodo tengo que decir a quien conoce (Dirección IP o FQDN)
    A cada nodo, le voy a decir que vaya a buscar a los maestros al 1 o al 2, da igual
    
    maestro1 > maestro2
    maestro2 > maestro1
    
    
    ES : 9200 Comunicaciones publicas/presentaciones
         9300 Comunicaciones internas

---------------------
StatefulSet de cada tipo de nodo ES
Deployment Kibana
Service Kibana + ( Ingress )
PVC ES
Service Maestro
Service Ingesta + ( Ingress )
Service Coordinación + Ingress
ConfigMap: Configuración de cada nodo
ConfigMap generico
Secrets: Usuario / Contraseña ES
NetworkPolicy... Flannel (no sirven los NetworkPolicy) >>>>> Calico <<<<<
    INGRESS:
    9300 capado a nivel de NS
    9200 capado a nivel de NS para data(siempre y cuando haya ingesta Y coordinador) y master
    EGRESS
    master y data (si hay ingesta y coordinador) no pueden salir a ningun sitio fuera del ns


Nodo1   -----      https     ---   Nodo2
Clave pub                           Clave pub
    Exporto certificado     <>          Exporto certificado
    Información CA                      Información CA
Clave priv                          Clave privada
Registrar CA como de confianza      Registrar CA como de confianza

¿Como resolvemos esto en Kubernetes?
    ISTIO 5 minutos ... con certificados + renovación certificados autom....