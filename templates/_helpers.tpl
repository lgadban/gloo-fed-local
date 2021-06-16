{{/*
Create the encoded kubeconfig pointing to the local kubernetes api server
*/}}
{{- define "gloo-fed-local.kubeconfig" -}}
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: {{ (index .data "ca.crt" ) }}
    server: https://kubernetes.default.svc.cluster.local
  name: kind-kind1
contexts:
- context:
    cluster: kind-kind1
    namespace: gloo-system
    user: gloo-fed
  name: kind-kind1
current-context: kind-kind1
kind: Config
preferences: {}
users:
- name: gloo-fed
  user:
    token: {{ (index .data "token" ) | b64dec }}
{{- end -}}
