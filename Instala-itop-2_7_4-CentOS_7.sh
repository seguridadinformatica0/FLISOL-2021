#!/bin/bash
#==============================================================================
# Instalación de iTop 2.7.4 en CentOS 7
# 
#  Sitio Oficial - https://www.combodo.com/itop-193
#
# Uso:
#   1.- Convertir en archivo ejecutable.
#       $ chmod +x <archivo.sh>
#   2.- Ejecutar con permisos de admnistración o superadministrador.
#       # ./<archivo.sh>
#   3.- Continuar la instalación en el navegador web en la IP o URL del DOMINIO.
#
# Después de instalar iTop en tu navegador web, deberás cambiar los permisos 
# del archivo de configuración, puedes hacerlo mediante el siguiente comando:
# 
#       # chmod u+w /var/www/html/itop/conf/production/config-itop.php
# 
# Licencia GNU/GPL Versión 2 o superior
#
# Autor: Jorge Antonio Díaz Lara - jorge@integraci.com.mx
#==============================================================================

#==============================================================================
# Variables - Modifica sólamente esta parte (y lo demás si sabes lo que haces).
#==============================================================================
DOMINIO="cmdb.integraci.com.mx"          # Nombre del dominio del Sitio
CORREO_ADMIN="contacto@${DOMINIO}"       # Correo electrónico del adminsitrador

IP_SEGMENTO_ADMINISTRACION="192.168.1"	 # Dos, tres o cuatro octetos de la IP
DIRECTORIO="itop"			 # Nombre del directorio de instalación

USUARIO_CRON_ITOP="usuario_cron"         # Usuario para cron de iTop
USUARIO_CRON_ITOP_PASSWORD="password"    # Contraseña de usuario para cron iTop

MARIADB_ROOT_PASSWORD="password"         # Contraseña usuario "root" de MariaDB
BASE_DATOS_ITOP="itopdb"                 # Nombre de la Base de Datos para iTop
USUARIO_BASE_DATOS="usritopdb"           # Nombre usuario de Base de Datos
USUARIO_BASE_DATOS_PASSWORD="password"   # Contraseña de usuario de Base Datos

VERSION_ITOP="2.7.4"
#==============================================================================

#==============================================================================
# Preparación de servidor
#==============================================================================
# Limpia metadatos
yum clean metadata

# Actualiza paquetes 
yum -y update

#==============================================================================
# Instalación de repositorios
#==============================================================================
# Extra Packages for Enterprise Linux (EPEL)
yum -y install epel-release

# Remi's RPM repository
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

#==============================================================================
# Instalación de paquetes
#==============================================================================
yum -y install net-tools policycoreutils-python wget vim bash-completion unzip graphviz git expect
yum -y install httpd mod_ssl 

#==============================================================================
# Instalación de "PHP: Hypertext Preprocessor"
#==============================================================================
yum --enablerepo=remi,remi-php74 -y install php php-zip php-mysql php-xml php-xmlrpc php-ldap php-gd php-soap php-intl php-mbstring php-mcrypt

sed -i "s/post_max_size = 8M/post_max_size = 182M/g" /etc/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 180M/g" /etc/php.ini
sed -i "s/max_input_time = 60/max_input_time = 180/g" /etc/php.ini

#==============================================================================
# Descarga de iTop
#==============================================================================
git clone -b support/$VERSION_ITOP https://github.com/Combodo/iTop.git /var/www/html/$DIRECTORIO/
mkdir /var/www/html/$DIRECTORIO/{conf,env-production,env-production-build}

#==============================================================================
# Descarga Extensión - Monedas Adicionales para Contratos
#==============================================================================
git clone https://github.com/INTEGRACI/monedas-adicionales-contratos-itop.git /var/www/html/$DIRECTORIO/extensions/monedas-adicionales-contratos-itop

#==============================================================================
# Cron de iTop
#==============================================================================
mkdir /etc/$DIRECTORIO
mv /var/www/html/$DIRECTORIO/webservices/cron.distrib /etc/$DIRECTORIO/
sed -i "s/auth_user=admin/auth_user=${USUARIO_CRON_ITOP}/g" /etc/$DIRECTORIO/cron.distrib
sed -i "s/auth_pwd=admin/auth_pwd=${USUARIO_CRON_ITOP_PASSWORD}/g" /etc/$DIRECTORIO/cron.distrib
echo "* * * * * /usr/bin/php /var/www/html/$DIRECTORIO/webservices/cron.php --param_file=/etc/$DIRECTORIO/cron.distrib >>/var/log/${DIRECTORIO}-cron.log 2>&1" | crontab

#==============================================================================
# Configuración de Virtualhost
#==============================================================================
cat << EOF > /etc/httpd/conf.d/00-$DIRECTORIO.conf
<VirtualHost *:80>
 ServerName ${DOMINIO}:80
 ServerAdmin $CORREO_ADMIN
 DocumentRoot "/var/www/html/$DIRECTORIO"
 DirectoryIndex index.php index.html
 CustomLog '|/usr/sbin/rotatelogs "/var/log/httpd/access_${DIRECTORIO}_log" 604800 -360' "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\""
 ErrorLog '|/usr/sbin/rotatelogs "/var/log/httpd/error_${DIRECTORIO}_log" 604800 -360'
 ExpiresActive On
 ExpiresByType image/jpg "access plus 1 month"
 ExpiresByType image/png "access plus 1 month"
 ExpiresByType image/gif "access plus 1 month"
 ExpiresByType image/jpeg "access plus 1 month"
 ExpiresByType text/css "access plus 1 month"
 ExpiresByType image/x-icon "access plus 1 month"
 ExpiresByType application/pdf "access plus 1 month"
 ExpiresByType audio/x-wav "access plus 1 month"
 ExpiresByType audio/mpeg "access plus 1 month"
 ExpiresByType video/mpeg "access plus 1 month"
 ExpiresByType video/mp4 "access plus 1 month"
 ExpiresByType video/quicktime "access plus 1 month"
 ExpiresByType video/x-ms-wmv "access plus 1 month"
 ExpiresByType application/x-shockwave-flash "access 1 month"
 ExpiresByType text/javascript "access plus 2 month"
 ExpiresByType application/x-javascript "access plus 1 month"
 ExpiresByType application/javascript "access plus 1 month"
 <Directory "/var/www/html/$DIRECTORIO">
 AllowOverride all
 Options All -Includes -ExecCGI -Indexes +MultiViews
 Require all granted
 </Directory>
 <Directory "/var/www/html/$DIRECTORIO/setup">
 AllowOverride all
 Options All -Includes -ExecCGI -Indexes +MultiViews
 Require ip $IP_SEGMENTO_ADMINISTRACION
 ErrorDocument 403 http://${DOMINIO}/
 </Directory>
 LogLevel warn
</VirtualHost>
EOF

#==============================================================================
# Configuración de archivo /etc/hosts
#==============================================================================
echo -ne "127.0.0.1\t$DOMINIO" >> /etc/hosts

#==============================================================================
# Seguridad por contexto - SELinux
#==============================================================================
setsebool -P httpd_can_network_connect_db on
setsebool -P httpd_can_connect_ldap on

chcon -u system_u /etc/$DIRECTORIO/cron.distrib
chcon -t etc_t /etc/$DIRECTORIO/cron.distrib
chcon -u system_u /etc/httpd/conf.d/00-$DIRECTORIO.conf
chcon -t httpd_config_t /etc/httpd/conf.d/00-$DIRECTORIO.conf
chcon -R -u system_u /var/www/html/*
chcon -R -t httpd_sys_content_t /var/www/html/$DIRECTORIO

semanage fcontext -a -t etc_t "/etc/$DIRECTORIO/cron.distrib"
semanage fcontext -a -t httpd_config_t "/etc/httpd/conf.d/00-${DIRECTORIO}.conf"
semanage fcontext -a -t httpd_sys_content_t "/var/www/html/$DIRECTORIO(/.*)?"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/conf"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/data"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/env-production"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/env-production-build"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/log"
semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/$DIRECTORIO/extensions"

restorecon -R -v "/var/www/html/$DIRECTORIO"
restorecon -v "/etc/httpd/conf.d/00-${DIRECTORIO}.conf"
restorecon -v "/var/www/html/$DIRECTORIO/conf"
restorecon -v "/var/www/html/$DIRECTORIO/data"
restorecon -v "/var/www/html/$DIRECTORIO/env-production"
restorecon -v "/var/www/html/$DIRECTORIO/env-production-build"
restorecon -v "/var/www/html/$DIRECTORIO/log"
restorecon -v "/var/www/html/$DIRECTORIO/extensions"

#==============================================================================
# Propietario y permisos de archivos
#==============================================================================
chown -R apache:apache /var/www/html/$DIRECTORIO
find /var/www/html/$DIRECTORIO -type d -exec chmod 755 {} \;
find /var/www/html/$DIRECTORIO -type f -exec chmod 644 {} \;

#==============================================================================
# Permitir tráfico HTTP y HTTPS (puertos 80 y 443)
#==============================================================================
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

#==============================================================================
# Servidor HTTP - Apache
#==============================================================================
# Activar el servicio de base de datos MariaDB al iniciar el equipo
systemctl enable httpd.service

# Iniciar el servicio de base de datos MariaDB
systemctl start httpd.service

#==============================================================================
# Servidor de base de datos - MariaDB
#==============================================================================
# Instalación de repositorios oficiales de MariaDB
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

# Instalación de servidor de base de datos MariaDB
yum -y install mariadb mariadb-server

# Configuracón del máximo tamaño de paquetes permitido
sed -i "s/\[client-server\]/\[client-server\]\nmax_allowed_packet=183M/g" /etc/my.cnf

# Activar el servicio de base de datos MariaDB al iniciar el equipo
systemctl enable mariadb.service

# Iniciar el servicio de base de datos MariaDB
systemctl start mariadb.service

# Configuración de MariaDB mediante "mysql_secure_installation"
INSTALACION_SEGURA_MARIADB=$(expect -c "
   set timeout 10
   spawn mysql_secure_installation
   expect \"Enter current password for root (enter for none): \"
   send \"\r\"
   expect \"Switch to unix_socket authentication \[Y/n\] \" 
   send \"Y\r\"
   expect \"Change the root password? \[Y/n\] \"
   send \"Y\r\"
   expect \"New password:\"
   send \"$MARIADB_ROOT_PASSWORD\r\"
   expect \"Re-enter new password:\"
   send \"$MARIADB_ROOT_PASSWORD\r\"
   expect \"Remove anonymous users? \[Y/n\] \"
   send \"Y\r\"
   expect \"Disallow root login remotely? \[Y/n\] \"
   send \"Y\r\"
   expect \"Remove test database and access to it? \[Y/n\] \"
   send \"Y\r\"
   expect \"Reload privilege tables now? \[Y/n\] \"
   send \"Y\r\"
   expect EOF
")
echo "$INSTALACION_SEGURA_MARIADB"

# Creación de base de datos para iTop
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE $BASE_DATOS_ITOP DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"

# Creación de usuario y permisos para iTop
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL ON $BASE_DATOS_ITOP.* TO '${USUARIO_BASE_DATOS}'@'localhost' identified by '${USUARIO_BASE_DATOS_PASSWORD}'"
