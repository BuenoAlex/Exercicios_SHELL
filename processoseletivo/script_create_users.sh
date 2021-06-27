#!/bin/bash
#Atividades:
#1- Varrer o diretório procurando arquivos csv
#2- Ler o arquivo 
#3- Realizar o insert das linhas

read_file_content(){
  local file_name=$1
  sed 1d $1 | while IFS='\n' read line
  	do    
		echo $line | while IFS=';' read NOME CIDADE CARGO
	 do
		if sudo adduser $NOME --gecos $CIDADE,$CARGO --ingroup usuarionovo --disabled-login; then
			echo  $NOME" "$CIDADE" "$CARGO"--usuario criado"
		else
			echo "Erro ao criar o usuário $NOME"
		fi	
	 done
	done
}

#Procurando arquivos csv no Diretorio
read_files(){
  shopt -s nullglob
  for arquivo in *.csv
  do
   read_file_content $arquivo
  done
}

read_files
