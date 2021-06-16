Registers the local gloo installation with Gloo Fed

It updates an already used clusterrole: `gloo-fed`

NOTE: It is mandatory to execute following command to overwrite the helm release:

`kubectl annotate clusterrole/gloo-fed 'meta.helm.sh/release-name=gloo-fed-local' --overwrite`

`oc annotate clusterrole/gloo-fed 'meta.helm.sh/release-name=gloo-fed-local' --overwrite`
