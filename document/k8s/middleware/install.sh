#!/bin/bash

# 定义命名空间
NAMESPACE="default"

# 创建命名空间
kubectl create namespace $NAMESPACE

# 安装 MySQL
kubectl apply -f middleware/mysql.yaml -n $NAMESPACE
echo "MySQL installed."

# 安装 MongoDB
kubectl apply -f middleware/mongodb.yaml -n $NAMESPACE
echo "MongoDB installed."

# 安装 Redis
kubectl apply -f middleware/redis.yaml -n $NAMESPACE
echo "Redis installed."

# 安装 RabbitMQ
kubectl apply -f middleware/rabbitmq.yaml -n $NAMESPACE
echo "RabbitMQ installed."

# 安装 Elasticsearch
kubectl apply -f middleware/elasticsearch.yaml -n $NAMESPACE
echo "Elasticsearch installed."

# 安装 Logstash
kubectl apply -f middleware/logstash.yaml -n $NAMESPACE
echo "Logstash installed."

# 安装 Kibana
kubectl apply -f middleware/kibana.yaml -n $NAMESPACE
echo "Kibana installed."

# 安装 MinIO
kubectl apply -f middleware/minio.yaml -n $NAMESPACE
echo "MinIO installed."

# 安装 Nacos
kubectl apply -f middleware/nacos.yaml -n $NAMESPACE
echo "Nacos installed."

# 安装 Sentinel
kubectl apply -f middleware/sentinel.yaml -n $NAMESPACE
echo "Sentinel installed."

echo "All services installed successfully."