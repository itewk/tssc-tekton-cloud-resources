{{/*
Expand the name of the chart.
*/}}
{{- define "tssc-workflow-tekton-shared-resources.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tssc-workflow-tekton-shared-resources.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tssc-workflow-tekton-shared-resources.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tssc-workflow.labels" -}}
helm.sh/chart: {{ include "tssc-workflow-tekton-shared-resources.chart" . }}
{{ include "tssc-workflow.selectorLabels" . }}
{{- if .Chart.AppVersion }}
tssc/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: tssc-workflow
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tssc-workflow.selectorLabels" -}}
app.kubernetes.io/name: {{ (required "Global Value is required: serviceName" .Values.global.serviceName) }}
app.kubernetes.io/part-of: {{ (required "Global Value is required: applicationName" .Values.global.applicationName) }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Expand the name of the application service this pipeline is for.
*/}}
{{- define "tssc-workflow.resourcesName" -}}
{{- printf "tssc-workflow-%s-%s" (required "Global Value is required: applicationName" .Values.global.applicationName) (required "Global Value is required: serviceName" .Values.global.serviceName) | trunc 50 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.eventListenerName" -}}
{{- printf "%s" (include "tssc-workflow.resourcesName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.triggerTemplateName" -}}
{{- printf "%s" (include "tssc-workflow.resourcesName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.eventListenerRouteName" -}}
{{- printf "el-%s" (include "tssc-workflow.eventListenerName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.cronJobCleanupName" -}}
{{- printf "cleanup-%s" (include "tssc-workflow.resourcesName" .) | trunc 52 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.pipelineServiceAccountName" -}}
{{- printf "%s" (include "tssc-workflow.resourcesName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "tssc-workflow.pgpKeysSecretName" -}}
{{- if $.Values.global.pgpKeysSecretNameOverride }}
{{- $.Values.global.pgpKeysSecretNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "pgp-keys-%s" (include "tssc-workflow.resourcesName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "tssc-workflow.gitSSHKeysSecretName" -}}
{{- if $.Values.global.gitSSHKeysSecretNameOverride }}
{{- $.Values.global.gitSSHKeysSecretNameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "git-ssh-keys-%s" (include "tssc-workflow.resourcesName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
The Service for the EventListner is created by the Pipeline operator automatically.
The name of the created Service is created by adding 'el-' to the EventListner name.

NOTE:   it would be slicker to dynamically querier for the service after the EventListener is
        created, but you can't do that in helm templates, so this will have to do.
*/}}
{{- define "tssc-workflow.eventListenerServiceName" -}}
{{- printf "el-%s" (include "tssc-workflow.eventListenerName" .) }}
{{- end }}
