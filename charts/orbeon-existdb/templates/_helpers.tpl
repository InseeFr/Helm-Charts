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


{{- define "orbeon-existdb.api.name" -}}
{{- .Values.api.nameOverride | default (printf "%s-api" .Chart.Name ) }}
{{- end }}

{{- define "orbeon-existdb.ui.name" -}}
{{- .Values.ui.nameOverride | default (printf "%s-ui" .Chart.Name ) }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}

{{- define "orbeon-existdb.api.fullname" -}}
{{- if .Values.api.fullnameOverride }}
{{- .Values.api.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.api.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-api" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "orbeon-existdb.ui.fullname" -}}
{{- if .Values.ui.fullnameOverride }}
{{- .Values.ui.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.ui.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-ui" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "orbeon-existdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "orbeon-existdb.api.chart" -}}
{{- printf "orbeon-existdb-api" -}}
{{- end -}}

{{- define "orbeon-existdb.ui.chart" -}}
{{- printf "orbeon-existdb-ui" -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "orbeon-existdb.namespace" -}}
    {{- print .Release.Namespace -}}
{{- end -}}

{{/*
Common labels
*/}}

{{- define "orbeon-existdb.api.labels" -}}
helm.sh/chart: {{ include "orbeon-existdb.api.chart" . }}
{{ include "orbeon-existdb.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "orbeon-existdb.ui.labels" -}}
helm.sh/chart: {{ include "orbeon-existdb.ui.chart" . }}
{{ include "orbeon-existdb.ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}

{{- define "orbeon-existdb.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orbeon-existdb.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "orbeon-existdb.ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orbeon-existdb.ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Create the name of the voluemClaim
*/}}
{{- define "orbeon-existdb.api.volume.existdb" -}}
  {{- printf "%s-%s-exist-db" (include "orbeon-existdb.api.fullname" .) "volume" }}
{{- end }}

{{- define "orbeon-existdb.api.volume.existdata" -}}
  {{- printf "%s-%s-exist-data" (include "orbeon-existdb.api.fullname" .) "volume" }}
{{- end }}

{{- define "orbeon-existdb.api.volume.existlogs" -}}
  {{- printf "%s-%s-exist-logs" (include "orbeon-existdb.api.fullname" .) "volume" }}
{{- end }}

