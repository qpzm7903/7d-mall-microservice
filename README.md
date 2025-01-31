# 7d-mall

## 背景说明

极客时间「高楼的性能工程实战课」专栏项目

课程地址：https://time.geekbang.org/column/intro/100074001?tab=intro

[全链路压测实战 30 讲](https://time.geekbang.org/column/intro/100093001?tab=catalog)

[高楼的性能工程实战课](https://time.geekbang.org/column/article/378983?cid=100074001)

[性能测试实战 30 讲](https://time.geekbang.org/column/article/187963?cid=100042501)

## 项目介绍

`7d-mall-microservice` 是一套微服务电商，其是在开源电商项目 [mall-swarm](https://github.com/macrozheng/mall-swarm) 上进行了改造，采用了 Spring Cloud Hoxton & Alibaba、Spring Boot 2.3、Oauth2、MyBatis、Docker、k8s、Elasticsearch 等核心技术。
`7d-mall-microservice`在电商业务的基础集成了注册中心、配置中心、监控中心、网关等系统功能。。 

## 组织结构

```lua
7d-mall
├── mall-common  -- 工具类及通用代码模块
├── mall-mbg     -- MyBatisGenerator生成的数据库操作代码模块
├── mall-auth    -- 基于Spring Security Oauth2的统一的认证中心
├── mall-gateway -- 基于Spring Cloud Gateway的微服务API网关服务
├── mall-monitor -- 基于Spring Boot Admin的微服务监控中心
├── mall-member  -- 会员系统服务
├── mall-order   -- 订单系统服务
├── mall-cart    -- 购物车系统服务
├── mall-admin   -- 后台管理系统服务
├── mall-search  -- 基于Elasticsearch的商品搜索系统服务
├── mall-portal  -- 商城后台系统服务
├── mall-demo    -- 微服务远程调用测试服务
└── config       -- 配置中心存储的配置
```

## 系统技术栈



| 技术                   | 说明                 | 官网                                                 |
| ---------------------- | -------------------- |:---------------------------------------------------- |
| Spring Cloud           | 微服务框架           | https://spring.io/projects/spring-cloud              |
| Spring Cloud Alibaba   | 微服务框架           | https://github.com/alibaba/spring-cloud-alibaba      |
| Spring Boot            | 容器+MVC框架         | https://spring.io/projects/spring-boot               |
| Spring Security Oauth2 | 认证和授权框架       | https://spring.io/projects/spring-security-oauth     |
| MyBatis                | ORM框架              | http://www.mybatis.org/mybatis-3/zh/index.html       |
| MyBatisGenerator       | 数据层代码生成       | http://www.mybatis.org/generator/index.html          |
| PageHelper             | MyBatis物理分页插件  | http://git.oschina.net/free/Mybatis_PageHelper       |
| Knife4j                | 文档生产工具         | https://github.com/xiaoymin/swagger-bootstrap-ui     |
| Elasticsearch          | 搜索引擎             | https://github.com/elastic/elasticsearch             |
| RabbitMq               | 消息队列             | https://www.rabbitmq.com/                            |
| Redis                  | 分布式缓存           | https://redis.io/                                    |
| MongoDb                | NoSql数据库          | https://www.mongodb.com/                             |
| Docker                 | 应用容器引擎         | https://www.docker.com/                              |
| Druid                  | 数据库连接池         | https://github.com/alibaba/druid                     |
| OSS                    | 对象存储             | https://github.com/aliyun/aliyun-oss-java-sdk        |
| MinIO                  | 对象存储             | https://github.com/minio/minio                       |
| JWT                    | JWT登录支持          | https://github.com/jwtk/jjwt                         |
| LogStash               | 日志收集             | https://github.com/logstash/logstash-logback-encoder |
| Lombok                 | 简化对象封装工具     | https://github.com/rzwitserloot/lombok               |
| Seata                  | 全局事务管理框架     | https://github.com/seata/seata                       |
| Kubernetes             | 应用容器管理平台     | https://kubernetes.io/                               |
|Sentinel|服务保护|https://sentinelguard.io/zh-cn/|
|SkyWalking|分布式追踪、服务网格遥测分析、度量聚合和可视化一体化解决方案|http://skywalking.apache.org|


## 系统架构
![系统架构图](./document/images/arch.png)

## 部署架构

![部署架构图](https://img-blog.csdnimg.cn/20210330185951870.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3p1b3pld2Vp,size_16,color_FFFFFF,t_70)



## 开发环境搭建 
mall-swarm项目运行需要MySQL、Redis、RabbitMQ、Elasticsearch、Logstash、Kibana、MongoDB、MinIO、Nacos这些服务，需要先把它们启动起来。

### docker安装


### 手工创建库与表

### sentinel
默认账号密码

账号 `sentinel`

密码 `sentinel`

### springboot admin

account ``  

password  ``

### mq
手工创建/mall vhost以及配置权限

### nacos config

common.yml

```yaml 
spring:
  datasource:
    druid:
      url: jdbc:mysql://localhost:3306/mall_full_link?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai
      username: root
      password: admin
      initial-size: 5
      min-idle: 10
      max-active: 20
      web-stat-filter:
        exclusions: "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*"
      stat-view-servlet:
        login-username: druid
        login-password: druid
  redis:
    host: localhost
    database: 1
    port: 6379
    timeout: 3000ms
  rabbitmq:
    host: localhost
    port: 5672
    username: root
    password: admin
  data:
    mongodb:
      host: localhost
      port: 27017
      database: mall-port
  elasticsearch:
    rest:
      uris: localhost:19200
  cloud:
    sentinel:
      transport:
        port: 18719
        dashboard: localhost:18080
      eager: true
minio:
  endpoint: http://localhost:9090
  bucketName: mall
  accessKey: minioadmin
  secretKey: minioadmin
```

## 许可证

[Apache License 2.0](LICENSE)

Copyright (c) 2020-2022 7DGroup
