#!/bin/bash

#Variaveis
ARQUIVO='covid19_1.csv' #Digite entre aspas simples o nome do arquivo que sera pesquisado
ARQUIVO_FILTRO='covid19_filtro.csv' #Digite entre aspas simples o nome do arquivo que sera salvo
CIDADE='SAO JOSE DOS PINHAIS' #Digite entre aspas simples o nome da cidade

#Zera as variaveis
DT_NACIMENTO=' '
SEXO1=' '
OPCAO=' '
a=1

#Limpa a tela
clear

#Laco para baixar os arquivos
while [ $a -le 3 ]
do
    echo 
    echo "****************************************************************"
    echo Copie o link Dados UF - Parte $a
    echo
    tput setaf 1; echo -n "Cole o link Dados UF - Parte $a : "; tput sgr0
    read PARTE;

    wget $PARTE -O covid19_$a.csv
done

#Verifica se baixou os 3 arquivos
$BAIXOU=`ls -lath covid19_*.csv | wc -l`
echo 
echo "****************************************************************"
echo
if [ $BAIXOU -ne 3 ]
    echo Nao baixou os 3 arquivos, execute o script novamente!!!
    sleep 10
    exit 1
fi

#Limpa a tela
clear

#Laco para verificar se digitou uma data valida
while true
do
    echo 
    echo "****************************************************************"
    echo 
    tput setaf 1; echo -n "Digite a data de nascimento AAAA-MM-DD. Ex 1981-12-28: "; tput sgr0
    read DT_NASCIMENTO;
    
    #DT_NACIMENTO=$(date -d "$DT_NASC" +%F) #Converte a data para padrao invertida AAAA-MM-DD
    date "+%Y-%m-%d" -d "$DT_NASCIMENTO" > /dev/null 2>&1 #Valida a data

    #Se for uma data valida se for sai do laco
    if [ $? = 0 ]
    then
        break
    fi

done  

#Laco para verificar se digitou m, M, f ou F
while true
do
    echo 
    echo "****************************************************************"
    echo 
    tput setaf 1; echo -n "Digite o sexo M ou F: "; tput sgr0
    read SEXO1;
    
    SEXO=$( echo "$SEXO1" | tr '[:lower:]' '[:upper:]' ) #Converte para maiuscula
    
    if [ "$SEXO" = "M" ] || [ "$SEXO" = "F" ]; then break; fi #Verifica se e M ou F  e se for sai do laco
done

#Laco para verificar qual a vacina
while true
  do
    echo
    echo "****************************************************************"
    echo
    tput setaf 1; echo "Escolha a Vacina aplicada:"; tput sgr0
    tput setaf 3; echo "1 - ASTRAZENECA"; tput sgr0
    tput setaf 3; echo "2 - CORONAVAC"; tput sgr0
    tput setaf 3; echo "3 - JANSSEN"; tput sgr0
    tput setaf 3; echo "4 - PFIZER"; tput sgr0
    tput setaf 1; echo -n "Digita de 1 ao 4 para escolher a vacina: "; tput sgr0
    read OPCAO;

    
    case $OPCAO in
        "1")
            VACINA='ASTRAZENECA'
            break
            ;;
        "2")
            VACINA='CORONAVAC'
            break
            ;;
        "3")
            VACINA='JANSSEN'
            break
            ;;
        "4")
            VACINA='PFIZER'
            break
            ;;
        "*") #Se digitar qualquer outro numero continua no laco
    esac
done

#Confirma os dados digitados
echo 
echo "****************************************************************"
echo 
tput setaf 1; echo DIGITADO OS SEGUINTES DADOS:; tput sgr0

tput setaf 3; echo -n "Data de nascimento: "; tput sgr0
echo $DT_NASCIMENTO
tput setaf 3; echo -n "Sexo: "; tput sgr0
echo $SEXO
tput setaf 3; echo -n "Cidade: "; tput sgr0
echo $CIDADE
tput setaf 3; echo -n "Vacina: "; tput sgr0
echo $VACINA

while true
do
    tput setaf 1; echo -n "Os dados estao corretos? SIM ou NAO "; tput sgr0
    read CONFIRMA;
    
    CONFIRMACAO=$( echo "$CONFIRMA" | tr '[:lower:]' '[:upper:]' )
    
    if [ "$CONFIRMACAO" = "SIM" ]; then break; fi
    
    if [ "$CONFIRMACAO" = "NAO" ]
    then
        echo 
        echo "****************************************************************"
        echo 
        echo "Execute novamente o script!!!"
        echo 
        echo "****************************************************************"
 
        sleep 10
        exit 1
    fi
done



echo 
echo "****************************************************************"
echo 
tput setaf 2; echo "Iniciado pesquisa no arquivo $ARQUIVO, aguarde..."; tput sgr0


#Cabecalho do arquivo csv
head -1 $ARQUIVO > $ARQUIVO_FILTRO

#Executa o filtro nos arquivo 
for entry in "ls covid*.csv"
do
    grep -P "(?=$DT_NASCIMENTO).*?(?=\"$SEXO\").*?(?=$CIDADE).*?(?=$VACINA)" ./$entry >> ./$ARQUIVO_FILTRO
done



echo 
echo "****************************************************************"
echo 
echo "Terminado de fazer o filtro, pode abrir o arquivo $ARQUIVO_FILTRO!!!"
echo 
echo "****************************************************************"

