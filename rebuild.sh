#!/bin/bash

set -ef

helm lint ../helm-charts/zookeeper-subchart
helm package ../helm-charts/zookeeper-subchart

helm lint ../helm-charts/kafka-subchart
helm package ../helm-charts/kafka-subchart

helm lint ../helm-charts/kafka-op5-subchart
helm package ../helm-charts/kafka-op5-subchart

helm lint ../helm-charts/kafka-op5-2-subchart
helm package ../helm-charts/kafka-op5-2-subchart

helm lint ../helm-charts/schema-registry-subchart
helm package ../helm-charts/schema-registry-subchart

helm repo index . 
git commit --all -m 'New chart version'
git push

helm dep up ../helm-charts/kafka_cluster
helm lint ../helm-charts/kafka_cluster
helm package ../helm-charts/kafka_cluster

#helm dep up ../helm-charts/kafka_cluster_op5
#helm lint ../helm-charts/kafka_cluster_op5
#helm package ../helm-charts/kafka_cluster_op5

#helm dep up ../helm-charts/kafka_cluster_op5_2
#helm lint ../helm-charts/kafka_cluster_op5_2
#helm package ../helm-charts/kafka_cluster_op5_2

helm repo index . 
git commit --all -m 'New chart version'
git push


