#!/bin/bash
#	@drowkid01 | Script básico que genera claves y encripta archivos.
#	open-source, clona el repositorio en tu terminal y rm -rf .git !
comando="/data/data/com.termux/files/usr/bin/aes"
if [ -e $2 ]; then
cd $HOME
cd aes-256-tmx
chmod +x *
cp aes.sh aes
mv aes ~/../usr/bin
fi
function linea(){
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$1"
}
function selectw(){
linea "\e[1;30m"
read -p "  ╰► Seleccione su opción: " x
}
function menu(){
echo -e "	\e[1;30m[\e[1;33m$1\e[1;30m] \e[1;33m➤➤➤ \e[1;32m$2 "
}
aes(){
 encrypt(){
 linea
 read -p "Ingrese el nombre del archivo a encriptar: " name
 if [ -e $name ]; then
 linea
 arch=$(openssl enc -aes-256-cbc -a -A -md sha512 -pbkdf2 -iter 250000 -salt -in $name -out "${name}.e")
 echo -e "\e[1;33m E N C R I P T A C I Ó N  E X I T O S A \n${arch}\n \033[1;31m ${name} ➤➤➤ \e[1;32m ${name}.e"
 else
 echo -e "\e[1;31msu archivo no existe."
 fi
 }
 desencrypt(){
 linea
 read -p "Ingrese el nombre de su archivo a desencriptar: " arch
 if [ -e $arch ]; then
 arch=$(openssl enc -aes-256-cbc -a -A -md sha512 -pbkdf2 -iter 250000 -salt -d -in $name -out "${name}.d")
 echo -e "\e[1;33m D E S E N C R I P T A C I Ó N  E X I T O S A \n${arch}\n  \e[1;31m${name} ➤➤➤ \033[1;32m ${name}.d"
 else
 echo -e "\033[1;31msu archivo no existe"
 fi
 }
case $1 in
-e)encrypt ;;
-d)desencrypt ;;
esac
}
clear
linea
echo -e "\e[1;32m	┏━┓┏━╸┏━┓   \e[1;35m┏━┓┏━╸┏━┓   \e[1;34m╺┳╸┏┳┓╻ ╻
\e[1;36m	┣━┫┣╸ ┗━┓\e[1;30m╺━╸\e[1;34m┏━┛┗━┓┣━┓\e[1;30m╺━╸\e[1;33m ┃ ┃┃┃┏╋┛
\e[1;35m	╹ ╹┗━╸┗━┛   \e[1;31m┗━╸┗━┛┗━┛   \e[1;32m ╹ ╹ ╹╹ ╹"
linea
echo -e "		@drowkid01"
linea
menu "1" "encriptar archivo"
menu "2" "desencriptar archivos"
menu "3" "encriptar directorios"
menu "4" "desencriptación multi-formato"
selectw
case $x in
1)aes -e ;;
2)aes -d ;;
3)
if [ -e $2 ]; then
 tarr(){
 read -p "ingrese el nombre del directorio/carpeta a encriptar: " nAmE
 read -p "ingrese el nuevo nombre para la carpeta encriptada: " NaMe
 uo=$(tar --create $nAmE -f $NaMe)
 echo -e "\e[1;32m[✓]su carpeta \e[1;33m${nAmE}\033[1;32mfue encriptada usando \e[1;33m ${NaMe}${uo}\e[1;32m como su nuevo nombre.[✓]"
 }
 gzi(){
 read -p "ingrese el nombre del directorio/carpeta a encriptar: " nAmE
 read -p "ingrese el nuevo nombre para la carpeta encriptada: " NaMe
 sleep 5
 echo -e "\e[1;34mxdd esta opción ni viene xd, luego actualizo el perro script xd"
 }
linea
echo -e "\e[1;33m	E L I J A  E L  F O R M A T O "
linea
menu "1" "tar"
menu "2" "gzip"
menu "3" "rar"
menu "4" "zip"
menu "5" "gpg"
selectw
 [[ $x = @(1|01) ]] && {
 tarr
 } || {
 gzi
 }
fi
;;
esac

