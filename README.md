## Step 1
First, in the `gloo-fed` chart update the file `gloo-fed/templates/gloo-fed-rbac.yaml` to contain RBAC permissions required for the gloo-fed controller --

At line 69, right below the block:
```
- apiGroups:
  - fed.solo.io
  resources:
  - glooinstances/status
  - failoverschemes/status
  verbs:
  - get
  - update
```

change the ending of the `ClusterRole` to:
```
- apiGroups:
  - gloo.solo.io
  - gateway.solo.io
  - enterprise.gloo.solo.io
  - ratelimit.solo.io
  resources:
  - '*'
  verbs:
  - '*'
- apiGroups:
  - apps
  resources:
  - deployments
  - daemonsets
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - pods
  - nodes
  - services
  - secrets
  verbs:
  - get
  - list
  - watch
```

## Step 2
Then we can install the chart via `helm` as ArgoCD does not work with this chart.
From this cloned repo:

`helm install gloo-fed-local ./ -n gloo-system`
