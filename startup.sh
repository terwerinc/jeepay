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

echo ">>>>>>> "
echo ">>>>>>> "
echo ">>>>>>>安装完成， 所有的配置文件和项目文件都在：$rootDir 文件夹中。 "
echo ">>>>>>>项目访问地址 （注意开通端口防火墙）：   "
echo ">>>>>>>运营平台： http://外网IP:19217   账号密码： jeepay/jeepay123   "
echo ">>>>>>>商户平台： http://外网IP:19218   账号密码： 需要登录运营平台手动创建。    "
echo ">>>>>>>支付网关： http://外网IP:19216   "
echo ">>>>>>>若配置域名请更改 $rootDir/nginx/conf/nginx.conf 配置文件。 "
echo ""
echo "Complete."