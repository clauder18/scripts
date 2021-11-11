#!/bin/bash
#
#https://github.com/clauder18/star1.git
#
# Parar o apache 
systemctl stop apache2
 
# Aguarda 10 seg (tempo do apache parar) 
sleep 10
 
# Renova o certificado
/usr/bin/certbot -q renew
 
# Aguarda o certificado renovar
sleep 30
 
# Altera as permissoes para o usuário speedtest conseguir ler os certificados
/usr/bin/chown speedtest. /etc/letsencrypt/ -R
 
# Aguarda 2 seg
sleep 2
 
# Restarta o apache 
systemctl restart apache2
sleep 10
# Restarta o apache mais uma vez so por garantia (opcional)
systemctl restart apache2
 
# Para o ooklaserver
/etc/speedtest/ooklaserver.sh stop 
sleep 120
# Inicia o ooklaserver
su - speedtest -c "/etc/speedtest/OoklaServer --daemon"