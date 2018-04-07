# Stack 2
### Note: It works on single host only.

![image](https://user-images.githubusercontent.com/29029753/38450146-a1a5adf6-3a36-11e8-9a96-85f0f80a1406.png)

## 1. Install DB.

```
# yum install mariadb-server -y
# systemctl enable mariadb 
# systemctl start mariadb
# curl -s https://raw.githubusercontent.com/cit-aliqui/APP-STACK/master/Stack-2/dbschema.sql >/root/dbschema.sql
# mysql < /root/dbschema.sql
```

## 2. Install Tomcat. (Application we are using springboot)

```
# yum install maven -y
# cd /tmp
# wget https://github.com/cit-aliqui/APP-STACK/raw/master/Stack-2/rdp_api.zip 
# unzip rdp_api.zip 
# cd rdp_api
# mvn clean package
# cd /root
# wget -q -O- http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.6/bin/apache-tomcat-9.0.6.tar.gz | tar -xz
# cd /root/apache-tomcat-9.0.6
# rm -rf webapps/*
# cp /tmp/rdp_api/target/rdp-api.war webapps/rdp-api.war
# sh bin/startup.sh
```

## 3. Install WebServer
```
# yum install httpd httpd-devel gcc -y
# systemctl enable httpd
# systemctl start httpd
# cd /root
# wget -q -O- http://www-eu.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.43-src.tar.gz | tar -xz
# cd /root/tomcat-connectors-1.2.43-src/native
# ./configure --with-apxs=/usr/bin/apxs
# make
# make install

# cat /etc/httpd/conf.d/mod-jk.conf
LoadModule jk_module modules/mod_jk.so

JkWorkersFile conf.d/worker.properties
JkMount /rdp-api local
JkMount /rdp-api/* local

# cat /etc/httpd/conf.d/worker.properties 
worker.list=local
worker.local.host=localhost
worker.local.port=8009

# systemctl restart httpd
# cd /var/www/html
# wget https://github.com/cit-aliqui/APP-STACK/raw/master/Stack-2/rdportal.zip 
# uzip rdportal.zip
```

Update Public IP address of your server in `rdportal/js/config.js`

```
# cat  config.js 
angular.module('myApp.config', []).constant('configData',{
    "url":'http://35.231.155.172/rdp-api/'
});
```
