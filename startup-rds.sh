# 创建一个 bridge网络
docker network create jeepay-net
# 启动项目
docker compose -f docker-compose-rds.yml up --build