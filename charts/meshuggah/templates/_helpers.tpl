{{/*
Expand the name of the chart.
*/}}


{{- define "meshuggah.api.name" -}}
{{- .Values.api.nameOverride | default (printf "%s-api" .Chart.Name ) }}
{{- end }}

{{- define "meshuggah.ui.name" -}}
{{- .Values.ui.nameOverride | default (printf "%s-ui" .Chart.Name ) }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}

{{- define "meshuggah.api.fullname" -}}
{{- if .Values.api.fullnameOverride }}
{{- .Values.api.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.api.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "meshuggah.ui.fullname" -}}
{{- if .Values.ui.fullnameOverride }}
{{- .Values.ui.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.ui.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "meshuggah.postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride -}}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "meshuggah.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "meshuggah.api.chart" -}}
{{- printf "meshuggah-api" -}}
{{- end -}}

{{- define "meshuggah.ui.chart" -}}
{{- printf "meshuggah-ui" -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "meshuggah.namespace" -}}
    {{- print .Release.Namespace -}}
{{- end -}}
{{- define "meshuggah.api.serviceMonitor.namespace" -}}
    {{- if .Values.api.metrics.serviceMonitor.namespace -}}
        {{- print .Values.api.metrics.serviceMonitor.namespace -}}
    {{- else -}}
        {{- include "meshuggah.namespace" . -}}
    {{- end }}
{{- end -}}

{{/*
Common labels
*/}}

{{- define "meshuggah.api.labels" -}}
helm.sh/chart: {{ include "meshuggah.api.chart" . }}
{{ include "meshuggah.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "meshuggah.ui.labels" -}}
helm.sh/chart: {{ include "meshuggah.ui.chart" . }}
{{ include "meshuggah.ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}

{{- define "meshuggah.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "meshuggah.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "meshuggah.ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "meshuggah.ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "meshuggah.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create }}
{{- default (include "meshuggah.api.fullname" .) .Values.api.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.api.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "meshuggah.ui.serviceAccountName" -}}
{{- if .Values.ui.serviceAccount.create }}
{{- default (include "meshuggah.ui.fullname" .) .Values.ui.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.ui.serviceAccount.name }}
{{- end }}
{{- end }}
