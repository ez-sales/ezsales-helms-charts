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

### Pull scw registry images from k8s
https://www.scaleway.com/en/docs/compute/kubernetes/how-to/deploy-image-from-container-registry/
```
kubectl create secret docker-registry registry-secret --docker-server=rg.fr-par.scw.cloud --docker-username=funcscwrecezsalesapivdpn8gpk --docker-password=04490ce1-0af7-4080-86fd-38f5b1edf70f
```