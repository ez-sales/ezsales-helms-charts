# Helm charts for EZ Sales

## Helm repository
All information are available at https://helm.ez-sales.eu/


## Installation
### EZ Sales API
When at root directory
```
helm uninstall ezsales-mkp-api
```

```
helm install -f ezsales-mkp-api/envs/staging-values.yaml ezsales-mkp-api ezsales-mkp-api --version "<CHART_VERSION>"
```

### EZ Sales MKP Front
When at root directory
```
helm uninstall ezsales-mkp-front
```

```
helm install -f ezsales-mkp-front/envs/<ENV_NAME>-values.yaml ezsales-mkp-front ezsales-mkp-front --version "<CHART_VERSION>"
```

Availables ENV_NAME are : [dev, staging]

### Debug
Add following options to enable debug and dry-run
```
--dry-run --debug
```

### Secret needed for helm to pull scw registry images
https://www.scaleway.com/en/docs/containers/kubernetes/how-to/deploy-image-from-container-registry/#how-to-create-an-image-pull-secret
To generate your own API key, you have to go on https://console.scaleway.com/iam/api-keys

```
kubectl create secret docker-registry registry-secret --docker-server=rg.fr-par.scw.cloud --docker-username=funcscwrecezsalesapivdpn8gpk --docker-password=<your_password>
```

## Add environment variable
You have to add this new environment variable in the environment conf files in `<project-name>/envs`

Then, in  `<project-name>/templates/configmap.yaml`, you have to add its value with the following syntax :  
`AUTH_ORIGIN: {{ .Values.front.auth.origin }}`

--> `front.auth.origin` is the variable path in `<env_name>-values.yaml`


envs values files should be commited in root of applications