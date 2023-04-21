# Helm charts for EZ Sales
## EZ Sales API
### Installation
When at root directory
```
helm install -f ezsales-api/envs/staging-values.yaml ezsales-api ezsales-api
```

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