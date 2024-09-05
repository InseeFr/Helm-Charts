# Meshuggah Chart

Helm chart to deploy Meshuggah Back Office and Postgres database from the chart proposed by Bitami

This chart is not fully generic but we tried to be as less specific as possible

## Environment values :

Environnement values are saved in a configMap both for ui and api. They came from the values.yaml file.

### In case of ui values :

```yaml
ui:
  env:
    key: values
```

### API environment values :

```yaml
api:
  env:
    key: values
```

Environnement values concerning the database such as host, schema, password and username are already pass to postgres. So we decided to pass them to the api throught the environement values in the `api\deployment.yaml`

## Metrics :construction_worker: 

This part is still in progress.

It's possible to enable metric for the api. It is not finished and some changes must be needed. The aim is to connect a prometheus operator. 

See `api/metrics-svc.yaml` and `api/servicemonitor.yaml` and `values.yaml` in the `api.metrics` block.
