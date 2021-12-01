{{- define "elasticsearch.elasticUserPassword" -}}
{{- .Values.elastic.auth.password | default (randAlphaNum 15) | b64enc -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-data" -}}
{{- .Release.Name }}-data-svc
{{- end -}}


{{- define "elasticsearch.nombre-servicio-maestro" -}}
{{- $nuevoContexto := dict "Default" "master" "Servicio" $.Values.master.service "ReleaseName" $.Release.Name -}}
{{- include "elasticsearch.nombre-servicio" $nuevoContexto -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-coordinacion" -}}
{{- $nuevoContexto := dict "Default" "coordinator" "Servicio" $.Values.coordinator.service "ReleaseName" $.Release.Name -}}
{{- include "elasticsearch.nombre-servicio" $nuevoContexto -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-ingesta" -}}
{{- $nuevoContexto := dict "Default" "ingest" "Servicio" $.Values.ingest.service "ReleaseName" $.Release.Name -}}
{{- include "elasticsearch.nombre-servicio" $nuevoContexto -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-kibana" -}}
{{- $nuevoContexto := dict "Default" "kibana" "Servicio" $.Values.kibana.service "ReleaseName" $.Release.Name -}}
{{- include "elasticsearch.nombre-servicio" $nuevoContexto -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio" -}}
{{- if .Servicio.name.fullOverride -}}
{{- .Servicio.name.fullOverride -}}
{{- else -}}
{{- .ReleaseName }}-{{ .Servicio.name.suffixOverride | default .Default -}}
{{- end -}}
{{- end -}}


{{- define "elasticsearch.nombre-configmap-general" -}}
{{- .Release.Name }}-configmap-general
{{- end -}}

{{- define "elasticsearch.nombre-configmap-default" -}}
{{- .Release.Name }}-configmap-default
{{- end -}}

{{- define "elasticsearch.nombre-secret-general" -}}
{{- .Release.Name }}-secret
{{- end -}}




{{- define "elasticsearch.imagen-elasticsearch" -}}
    {{- .Values.elastic.image.repo -}}:
    {{- .Values.elastic.image.tag | default .Values.tag | default .Chart.AppVersion -}}
{{- end -}}
{{- define "elasticsearch.imagen-kibana" -}}
    {{- .Values.kibana.image.repo -}}:
    {{- .Values.kibana.image.tag | default .Values.tag | default .Chart.AppVersion -}}
{{- end -}}

