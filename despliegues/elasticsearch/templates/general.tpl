{{- define "elasticsearch.nombre-servicio-maestro" -}}
{{- if .Values.master.service.name.fullOverride -}}
{{- .Values.master.service.name.fullOverride -}}
{{- else -}}
{{- .Release.Name }}-{{ .Values.master.service.name.suffixOverride | default "master-svc" -}}
{{- end -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-coordinacion" -}}
{{- if .Values.coordinator.service.name.fullOverride -}}
{{- .Values.coordinator.service.name.fullOverride -}}
{{- else -}}
{{- .Release.Name }}-{{ .Values.coordinator.service.name.suffixOverride | default "coordinator-svc" -}}
{{- end -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-ingesta" -}}
{{- if .Values.ingest.service.name.fullOverride -}}
{{- .Values.ingest.service.name.fullOverride -}}
{{- else -}}
{{- .Release.Name }}-{{ .Values.ingest.service.name.suffixOverride | default "ingest-svc" -}}
{{- end -}}
{{- end -}}

{{- define "elasticsearch.nombre-servicio-kibana" -}}
{{- if .Values.kibana.service.name.fullOverride -}}
{{- .Values.kibana.service.name.fullOverride -}}
{{- else -}}
{{- .Release.Name }}-{{ .Values.kibana.service.name.suffixOverride | default "kibana-svc" -}}
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
elasticsearch:7.12
{{- end -}}

{{ define "elasticsearch.imagen-kibana" }}
kibana:7.12
{{ end }}

