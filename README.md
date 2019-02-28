## Replicating issue #245

A small project to replicate Postgres exporter [issue #245](https://github.com/wrouesnel/postgres_exporter/issues/245).

Comprises three deployments:

1. postgres-exporter - The Postgres metrics exporter
2. postgres - The Postgres database server
3. curl-looper - A simple app which runs cURL against the postgres-exporter metrics endpoint every 15 seconds

### Running

The simplest way to get started is with [Minikube](https://kubernetes.io/docs/setup/minikube/).

With Minikube started do:

```
kubectl create -f https://raw.githubusercontent.com/jamesnetherton/postgres_exporter/reproduce-issue-245/deployment.yml
```

Wait for all pods to become ready:

```
kubectl get pod --watch
```

Check that metrics from the exporter are currently being scraped successfully:

```
kubectl logs -l app=curl-looper
```

Now scale the Postgres deployment to 0:

```
kubectl scale --replicas 0 deployment/postgres
```

Keep watching the Postgres exporter logs. After a short time it will crash:

```
kubectl logs -f postgres-exporter-ccb8f89b5-9p9n5
```
