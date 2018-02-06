#!/bin/bash

set -ef

helm lint ../helm-charts/zookeeper
helm package ../helm-charts/zookeeper

helm lint ../helm-charts/kafka
helm package ../helm-charts/kafka

helm lint ../helm-charts/kafka-op5
helm package ../helm-charts/kafka-op5

helm lint ../helm-charts/kafka-op5-3
helm package ../helm-charts/kafka-op5-3

#helm lint ../helm-charts/kafka-op5-2-subchart
#helm package ../helm-charts/kafka-op5-2-subchart

helm lint ../helm-charts/schema-registry
helm package ../helm-charts/schema-registry

helm repo index . 
git commit --all -m 'New chart version'
git push

helm repo update

rm ../helm-charts/kafka_cluster/charts/*
helm dep up ../helm-charts/kafka_cluster
helm lint ../helm-charts/kafka_cluster
helm package ../helm-charts/kafka_cluster

rm ../helm-charts/kafka_cluster_op6/charts/*
helm dep up ../helm-charts/kafka_cluster_op6
helm lint ../helm-charts/kafka_cluster_op6
helm package ../helm-charts/kafka_cluster_op6

helm repo index . 
git commit --all -m 'New chart version'
git push

helm repo update



