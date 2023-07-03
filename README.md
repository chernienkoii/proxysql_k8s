# ProxySQL on Kubernetes with exporter

### ProxySQL deployment options overview

- Deploy a ProxySQL "layer" (standalone config)
- Deploy a ProxySQL "layer" with a controller (aka core / satellite)
- Deploy ProxySQL as a sidecar
- Deploy ProxySQL Cascaded i.e. ProxySQL "layer" and ProxySQL as a sidecar

#### Deploy ProxySQL Layer

##### Install ProxySQL (proxy layer with service)

```
helm upgrade --install proxysql-cluster .../proxysql_k8s --create-namespace --namespace proxysql -f values.yaml
```

##### Change settings and re-deploy

```
vi files/proxysql.cnf 
helm upgrade proxysql-cluster ../proxysql_k8s -n proxysql
```

Optionally do a rolling restart (note, templates are configured to re-deploy on configmap changes, i.e. this step is not required unless configmap checksum is removed)

```
kubectl rollout restart deployment/proxysql-cluster
```

##### Delete `proxysql-cluster` deployment

```
helm delete proxysql-cluster
```
