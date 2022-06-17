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