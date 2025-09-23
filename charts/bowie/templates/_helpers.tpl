{{/* Extract domain suffix (ex: .example.org) */}}
{{- define "bowie.extract-domain-suffix" -}}
    {{- $host := . -}}
    {{- $parts := splitList "." $host -}}
    {{- if ge (len $parts) 2 -}}
    .{{ index $parts (sub (len $parts) 2) }}.{{ index $parts (sub (len $parts) 1) }}
    {{- end -}}
{{- end }}