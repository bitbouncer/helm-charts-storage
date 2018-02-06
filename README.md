# helm-charts-storage

#TBD move this to jenkins...


generic workflow
```
helm dep up $YOUR_CHART_PATH/
helm lint $YOUR_CHART_PATH/
helm package $YOUR_CHART_PATH/ # to build the tgz file and copy it here
helm repo index . 
git add .
git commit -m 'New chart version'
git push
```

example build
```
helm dep up ../helm-charts/zookeeper
helm lint ../helm-charts/zookeeper
helm package ../helm-charts/zookeeper

helm dep up ../helm-charts/kafka
helm lint ../helm-charts/kafka
helm package ../helm-charts/kafka

helm dep up ../helm-charts/schema-registry
helm lint ../helm-charts/schema-registry
helm package ../helm-charts/schema-registry

helm dep up ../helm-charts/kafka_cluster
helm lint ../helm-charts/kafka_cluster
helm package ../helm-charts/kafka_cluster
```

commit the changes
```
helm repo index . 
git add .
git commit --all -m 'New chart version'
git push
```

usage
```
helm repo remove bitbouncer 
rm ~/.helm/repository/cache/bitbouncer-index.yaml
helm repo add bitbouncer 'https://raw.githubusercontent.com/bitbouncer/helm-charts-storage/master/'
helm repo update
helm search  bitbouncer

helm repo update
helm install --name cluster0 bitbouncer/kafka_cluster --namespace testing
helm install --name cluster0 bitbouncer/kafka_cluster_op6 --namespace testing


helm ls --all --namespace testing

helm del --purge cluster0

```




