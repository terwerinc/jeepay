#
#   jeepay-manager（管理平台） java程序镜像构建脚本   .Power by terrfly
#

# ------   START   ------

# 基础镜像来自： https://hub.docker.com/ 官方OFFICIAL
# FROM openjdk:8u342-jdk
FROM maven:3.6.0-jdk-8-alpine

MAINTAINER Terrfly

ENV LANG en_US.UTF-8
RUN apk add --update ttf-dejavu fontconfig && rm -rf /var/cache/apk/*

# 配置环境变量，支持中文。
ENV LANG=C.UTF-8

# 设置时区 东八区， 解决日志时间不正确的问题。
ENV TZ=Asia/Shanghai

# 对外映射的端口 ( 不明确EXPOSE 也不影响映射  )
EXPOSE 9217

# 挂载目录 "/jeepayhomes/service/app/application.yml 这个文件不能写到VOLUME中， 否则将映射成为了目录导致启动异常。
VOLUME ["/jeepayhomes/service/logs", "/jeepayhomes/service/uploads"]

# 使用jeepay用户启动。 ( 需要 RUN adduser等一系列操作 )
# USER jeepay:jeepay

# 创建目录
RUN mkdir /jeepayhomes/service/app -p

# 打包
WORKDIR /jeepayhomes/sources/jeepay-manager

# 安装
# 注意：COPY 命令第一个参数对应的是宿主机器的文件系统，第二个参数是容器内部的文件系统
COPY ./jeepay-manager/target/jeepay-manager.jar /jeepayhomes/service/app/jeepay-manager.jar
COPY ./conf/manager/application.yml /jeepayhomes/service/app/application.yml

## 设置工作目录
WORKDIR /jeepayhomes/service/app

CMD ["java", "-jar", "jeepay-manager.jar"]

# ------   END   ------




