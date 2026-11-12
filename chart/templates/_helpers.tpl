{{- define "vprofile.fullname" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "vprofile.componentName" -}}
{{- printf "%s-%s" (include "vprofile.fullname" .root) .component | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "vprofile.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
