## Dev

### 后端

```bash
./startup.sh skipBuild
```

或者

```bash
./startup.sh
```

访问地址：

运营平台：
    http://localhost:9217
    账号密码： jeepay/jeepay123

## 前端

访问地址：

运营平台：http://localhost:8000/user/login

## Prod

```bash
./startup-rds.sh
```

## 端口

注意：暴露端口前面的是指宿主，后面的是容器内部。
如果是容器之间的网络通信，需要指定同一个桥接网络，而且需要用服务名称而不是 ip 地址，另外，容器之间的通信要使用内部端口。
外部暴露的端口仅仅用于外部链接测试。