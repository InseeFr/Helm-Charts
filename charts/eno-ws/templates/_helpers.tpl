{{/*
Expand the name of the chart.
*/}}

{{ define "render-value" }}
  {{- if kindIs "string" .value }}
    {{- tpl .value .context }}
  {{- else }}
    {{- tpl (.value | toYaml) .context }}
  {{- end }}
{{- end }}

{{- define "eno-ws.enoxml.name" -}}
{{- default .Values.enoxml.nameOverride | default (printf "%s-enoxml" .Chart.Name )}}
{{- end }}

{{- define "eno-ws.enojava.name" -}}
{{- default .Values.enojava.nameOverride | default (printf "%s-enojava" .Chart.Name )}}
{{- end }}



{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}

{{- define "eno-ws.enoxml.fullname" -}}
{{- if .Values.enoxml.fullnameOverride }}
{{- .Values.enoxml.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.enoxml.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-xml" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "eno-ws.enojava.fullname" -}}
{{- if .Values.enojava.fullnameOverride }}
{{- .Values.enojava.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.enojava.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-java" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}



{{/*
Create chart name and version as used by the chart label.
*/}}

{{- define "eno-ws.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "eno-ws.enoxml.chart" -}}
{{- printf "eno-ws-enoxml" -}}
{{- end -}}

{{- define "eno-ws.enojava.chart" -}}
{{- printf "eno-ws-enojava" -}}
{{- end -}}



{{/*
Common labels
*/}}

{{- define "eno-ws.enoxml.labels" -}}
helm.sh/chart: {{ include "eno-ws.enoxml.chart" . }}
{{ include "eno-ws.enoxml.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "eno-ws.enojava.labels" -}}
helm.sh/chart: {{ include "eno-ws.enojava.chart" . }}
{{ include "eno-ws.enojava.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}



{{/*
Selector labels
*/}}

{{- define "eno-ws.enoxml.selectorLabels" -}}
app.kubernetes.io/name: {{ include "eno-ws.enoxml.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "eno-ws.enojava.selectorLabels" -}}
app.kubernetes.io/name: {{ include "eno-ws.enojava.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
