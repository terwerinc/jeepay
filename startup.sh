#!/bin/sh

# 构建项目
echo "[1] 构建 java 项目 ...."
# 判断是否跳过构建
if [ "$1" != "skipBuild" ]; then
    echo "正在执行构建流程..."
    ./mvnw clean package -e -DskipTests
    if [ $? -ne 0 ]; then
        echo "构建失败，请检查错误日志。"
        exit 1
    fi
    echo "[1] 构建完成"
else
    echo "跳过构建流程"
fi
echo "[1] Done. "

# 创建网络
echo "[2] 构建虚拟网络 ...."
if ! docker network inspect jeepay-net >/dev/null 2>&1; then
  echo "网络 'jeepay-net'不存在，开始创建 ..."
  docker network create jeepay-net
else
  echo "网络 'jeepay-net' 已存在."
fi
echo "[2] Done. "

# Now run Docker Compose
echo "[3] 启动服务 ...."
docker compose -f docker-compose-dev.yml up --build
echo "[3] Done. "

# 启动入口
# 项目名称	方位地址
# payment	127.0.0.1:9216
# cashier	127.0.0.1:9226
# manager	127.0.0.1:9217
# manager-ui	127.0.0.1:9227
# merchant	127.0.0.1:9218
# merchant-ui	127.0.0.1:9228
