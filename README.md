# helm-charts-storage

#TBD move this to jenkins...

helm lint $YOUR_CHART_PATH/
helm package $YOUR_CHART_PATH/ # to build the tgz file and copy it here
helm repo index . 
git add .
git commit -m 'New chart version'
git push


helm lint ../helm-charts/zookeeper
helm package ../helm-charts/zookeeper

