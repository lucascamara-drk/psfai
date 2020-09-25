#!/usr/bin/zsh

# Heyall! My name is Lucas and these are my first scripts. I'm trying to make my own script for Arch post-install. If you find it simple, I don't care.

# Arch Linux user set

echo "*-*-*-*-*-*--"
echo "Esse pequeno script ajudará na criação de um usuário e torná-lo sudo!"
echo "!!Utilizar como root"
echo
sleep 3
echo "Vamos em frente? [S]" & read GO

if [[ $GO = "S" ]]; then
  echo
  echo "Prosseguindo...";
else exit & echo "-> Abortar." && exit
fi

echo
echo "Checando usuário..."

if [[ $USER = "root" ]]; then
  echo "Seu usuário é root"
  sleep 1
  echo "Prosseguindo com a instação do sudo"
  sleep 1
  pacman -S sudo
else
  echo "Abortar." && exit
fi

echo "Escolha um nome de usuário (sem espaços):" & read NC

#Cria o usuário

useradd -m -G root $NC

# Criar diretórios
echo
echo "É necessário criar as pastas de usuário? [S or cancel]" && read PU
if [[ $PU = "S" ]]; then
  echo
  echo "Criando as pastas do diretorio do usuario"
  mkdir /home/$NC/Documentos
  mkdir /home/$NC/Downloads
  mkdir /home/$NC/Musicas
  mkdir /home/$NC/Videos
  mkdir /home/$NC/Biblioteca
  echo
  ls -a /home/$NC
  echo
  echo "Ok"
else
  echo "Abortar." && exit
fi

echo "$NC ALL=(ALL) ALL" >> /etc/sudoers

sleep 1
echo "Permissao de sudo para $NC concedida"
echo

echo "Configure uma senha"
echo

passwd $NC

echo "Fechando configurações de usuário."
sleep 1
echo
echo "Pronto. Configurações de usuário feitas com sucesso."
echo
exit
