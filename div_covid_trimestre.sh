#!/bin/bash

#Variaveis
ARQUIVO='covid19_2021.csv' #Digite entre aspas simples o nome do arquivo que sera pesquisado
ARQUIVO_FILTRO='covid19_2021' #Digite entre aspas simples o nome do arquivo que sera salvo

#Faz Download do arquivo
    echo 
    echo "****************************************************************"
    echo Copie o link do arquivo para baixar:
    echo
    tput setaf 1; echo -n "Cole o link copiado : "; tput sgr0
    read PARTE;

    wget $PARTE -O $ARQUIVO

#Inicia a separacao dos arquivos por trimestre
CONT=1
    head -n 1 "$ARQUIVO" > "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    echo "****************************************************************"
    echo
    echo Separando "$CONT"º trimestre...
   
    awk -F";" -v d="2021-0[1-3]" '$2~d' "$ARQUIVO" >> "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    

    echo
    echo Separado o "$CONT"º trimestre...

CONT=2
    head -n 1 "$ARQUIVO" > "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    echo "****************************************************************"
    echo
    echo Separando "$CONT"º trimestre...
   
    awk -F";" -v d="2021-0[4-6]" '$2~d' "$ARQUIVO" >> "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    

    echo
    echo Separado o "$CONT"º trimestre...


CONT=3
    head -n 1 "$ARQUIVO" > "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    echo "****************************************************************"
    echo
    echo Separando "$CONT"º trimestre...
   
    awk -F";" -v d="2021-0[7-9]" '$2~d' "$ARQUIVO" >> "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    

    echo
    echo Separado o "$CONT"º trimestre...

CONT=4
    head -n 1 "$ARQUIVO" > "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    echo "****************************************************************"
    echo
    echo Separando "$CONT"º trimestre...
   
    awk -F";" -v d="2021-1[0-2]" '$2~d' "$ARQUIVO" >> "$ARQUIVO_FILTRO"_"$CONT"tri.csv
    

    echo
    echo Separado o "$CONT"º trimestre...




    echo
    echo "****************************************************************"
    echo
    echo Foi separado os quatro trimestres...
    echo
    echo "****************************************************************"