#!/bin/bash
#Atividades:
#1- Varrer o diretório procurando arquivos csv
#2- Ler o arquivo 
#3- Realizar o bloqueio dos usuários encontrados no arquivo CSV

read_file_content(){
  local file_name=$1
  sed 1d $1 | while IFS='\n' read line
  	do    
		echo $line | while IFS=';' read NOME CIDADE CARGO
	 do
 		sudo usermod -L $NOME --groups bloqueados
        	echo "Usuário "$NOME" bloqueado!" 
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
