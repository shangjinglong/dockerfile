# Version:1.0.1
FROM ubuntu:latest
#设置root用户为后续命令执行者
MAINTAINER shangjinglong "sjl.55555@163.com"
USER root
#执行操作
RUN apt-get update
RUN apt-get install -y nginx
#使用&&拼接命令
RUN touch test.txt && echo "abc">>abc.txt
#对外暴露端口
EXPOSE 80  8080 1038
#添加文件
ADD abc.txt /opt
#添加文件夹
ADD /tmp /opt/webapp
#添加网络文件
ADD https://www.baidu.com/img/bd_logo1.png /opt
#设置环境变量
ENV WEBAPP_PORT=9090
#设置工作目录
WORKDIR /opt
#设置启动参数
CMD ["ls","-l","-a”]
#设置劵
VOLUME ["/tmp","/var/www"]
#设置子镜像的触发操作
ONBUILD ADD . /app/src
ONBUILD RUN echo "on build executed">>onbuild.txt
