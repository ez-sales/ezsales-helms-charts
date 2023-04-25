{{/* vim: set filetype=mustache: */}}
{{/*
Return the target Kubernetes version
*/}}
{{- define "common.capabilities.kubeVersion" -}}
{{- if .Values.global }}
    {{- if .Values.global.kubeVersion }}
    {{- .Values.global.kubeVersion -}}
    {{- else }}
    {{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
    {{- end -}}
{{- else }}
{{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
{{- end -}}
{{- end -}}

{{/*
Returns true if the ingressClassname field is supported
Usage:
{{ include "common.ingress.supportsIngressClassname" . }}
*/}}
{{- define "common.ingress.supportsIngressClassname" -}}
{{- if semverCompare "<1.18-0" (include "common.capabilities.kubeVersion" .) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{/*
Renders the annotations for an ingress
Usage:
{{ include "common.ingress.annotations.render" ( dict "annotations" .Values.path.to.the.Value "ingressClassName" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "common.ingress.annotations.render" -}}
{{- range $key, $value := .annotations }}
{{- if or ( ne $key "kubernetes.io/ingress.class" ) ( not ( and ( $.ingressClassName ) ( include "common.ingress.supportsIngressClassname" $.context ))) }}
{{ $key }}: {{ $value | quote }}
{{- end -}}
{{- end -}}
{{- end -}}