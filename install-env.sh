#!/usr/bin/env bash
echo '==================1.开发环境准备================================'
echo '1.1请确保安装并java8, git, maven并设置好环境变量'
echo '1.2请确保安装并docker,docker-compose并设置好环境变量'

#确认环境信息准备就绪
read -r -p "开发环境准备好了吗? [Y/n] " envConfirm
case $envConfirm in
    [yY][eE][sS]|[yY])
		echo "Yes 继续执行"
		;;
    [nN][oO]|[nN])
		echo "No 终止执行"
		exit 1
       	;;
    *)
		echo "Invalid input... 终止执行"
		exit 1
		;;
esac

echo '==================1.3清理当前脚本启动的容器和产生的镜像(可选的)=============='
#清理当前脚本启动的容器和产生的镜像(可选的)
#docker stop sc-rabbitmq sc-redis sc-mysql
#docker rm sc-rabbitmq sc-redis sc-mysql
#docker image rm rabbitmq:alpine redis:alpine mysql:9.6-alpine

#docker stop sc-monitor-admin sc-authorization-server sc-authentication-server sc-organization sc-gateway-admin sc-gateway-web
#docker rm sc-monitor-admin sc-authorization-server sc-authentication-server sc-organization sc-gateway-admin sc-gateway-web
#docker image rm cike/admin cike/authorization-server:latest cike/authentication-server:latest cike/organization:latest cike/gateway-admin:latest cike/gateway-web:latest

echo '==================4.docker-compose启动公共服务==================='
#去docker-compose目录
cd docker-compose
echo '==================4.1显示环境变量: docker-compose/.env =========='
#显示环境变量
cat ./.env
echo ''

#按需要开启公共服务
echo '==================4.2启动 mysql or redis or rabbitmq ========'
docker-compose -f docker-compose.yml up

