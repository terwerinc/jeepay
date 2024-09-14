#!/bin/sh

# 创建网络
if ! docker network inspect jeepay-net >/dev/null 2>&1; then
  echo "Network 'jeepay-net' not found. Creating it..."
  docker network create jeepay-net
else
  echo "Network 'jeepay-net' already exists."
fi

# Now run Docker Compose
docker compose -f docker-compose-dev.yml up --build

# 启动入口
# 项目名称	方位地址
# payment	127.0.0.1:9216
# cashier	127.0.0.1:9226
# manager	127.0.0.1:9217
# manager-ui	127.0.0.1:9227
# merchant	127.0.0.1:9218
# merchant-ui	127.0.0.1:9228
