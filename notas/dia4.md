un if de un nil (~) , un mapa vacio {} , o una lista vacia []: response false
    NO SE ENTRA EN EL IF


{{- if .Values.wordpress.deploy.affinity }}
affinity: 
    {{- toYaml Values.wordpress.deploy.affinity | nindent 16 }}
{{- end }}








{{- with .Values.wordpress.deploy.affinity }}
affinity: 
    {{- toYaml . | nindent 16 }}
{{- end }}
1º IF de un objeto ~, {} [] no entra
2º Cambiado de directorio



.Values.wordpress.deploy.affinity
./Values/wordpress/deploy/affinity

.Values
.Release

Capabilities:0xc00053a120 
Chart:{{wordpress  [] 0.1.0 Chart para instalar wordpress [] []  v2   8.0.0 false map[]  [] application} true} 
Files:map[.helmignore:[35 32 80 97 116 116 101 114 110 115 32 116 111 32 105 103 110 111 114 101 32 119 104 101 110 32 98 117 105 108 100 105 110 103 32 112 97 99 107 97 103 101 115 46 10 35 32 84 104 105 115 32 115 117 112 112 111 114 116 115 32 115 104 101 108 108 32 103 108 111 98 32 109 97 116 99 104 105 110 103 44 32 114 101 108 97 116 105 118 101 32 112 97 116 104 32 109 97 116 99 104 105 110 103 44 32 97 110 100 10 35 32 110 101 103 97 116 105 111 110 32 40 112 114 101 102 105 120 101 100 32 119 105 116 104 32 33 41 46 32 79 110 108 121 32 111 110 101 32 112 97 116 116 101 114 110 32 112 101 114 32 108 105 110 101 46 10 46 68 83 95 83 116 111 114 101 10 35 32 67 111 109 109 111 110 32 86 67 83 32 100 105 114 115 10 46 103 105 116 47 10 46 103 105 116 105 103 110 111 114 101 10 46 98 122 114 47 10 46 98 122 114 105 103 110 111 114 101 10 46 104 103 47 10 46 104 103 105 103 110 111 114 101 10 46 115 118 110 47 10 35 32 67 111 109 109 111 110 32 98 97 99 107 117 112 32 102 105 108 101 115 10 42 46 115 119 112 10 42 46 98 97 107 10 42 46 116 109 112 10 42 46 111 114 105 103 10 42 126 10 35 32 86 97 114 105 111 117 115 32 73 68 69 115 10 46 112 114 111 106 101 99 116 10 46 105 100 101 97 47 10 42 46 116 109 112 114 111 106 10 46 118 115 99 111 100 101 47 10] prueba.yaml:[]]
Release:map[IsInstall:true IsUpgrade:false Name:RELEASE-NAME Namespace:default Revision:1 Service:Helm] Subcharts:map[] 
Template:map[BasePath:wordpress/templates Name:wordpress/templates/deployment.yaml] 
Values: map[externalDB:map[auth:map[existingSecret:map[enabled:true] password:change-me] enabled:true port:3306] mariadb:map[auth:map[database:wordpress existingSecret:patata password:change-me rootPassword:change-me username:usuario] enabled:false primary:map[persistence:map[enabled:false]]] wordpress:map[deploy:map[affinity:map[] allowReplicaDeploymentOnSameNode:allowed autoscale:map[cpu:2 enabled:true max:10 memory:2000Mi min:1] extraEnvVars:map[] initialReplicaCount:58 resources:map[limits:map[] requests:map[]]] extraLabels:map[] image:map[persistentPath:/var/www/html port:80 repo:wordpress tag:php8.0-apache] persistence:map[accessModes:[ReadWriteMany] enabled:false existingClaim:map[enabled:false] storageClassName:] service:map[loadBalancerIP:192.168.1.1 nameOverride:map[fullOverride:<nil> suffixOverride:<nil>] nodePort:33333 port:80 type:ClusterIP]]]]


