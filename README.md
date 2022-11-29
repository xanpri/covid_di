# covid_id

Pré-requisitos para Windows:
Você deve estar executando o Windows 10 versão 2004 e superior (Build 19041 e superior) ou o Windows 11 para usar os comandos abaixo.

1- Abrir o powershell como administrador e executar o comando abaixo para ativar o subsistema baseado em Linux no Windows:
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

2- Reinicie o computador:

3- Abra o powershell como administrador novamente e execute o comando para alterar a versão do wsl para 2:
wsl --set-default-version 2

4- Instale o Ubuntu:
wsl --install -d Ubuntu

5- Instale o Windows Terminal:
winget install "Windows Terminal" -h -s winget

6- Instale o git:
winget install "Git" -h -s winget
 
7- Criar a pasta c:\temp\covid
mkdir c:\temp\covid

8- cd c:\temp\covid
git clone https://github.com/xanpri/covid_id.git .




=====================================================
Para executar o script no Windows:

1- abra o terminal e execute
wsl --cd c:\temp\covid

2- Deixe o script executavel (OBS: execute somente a primeira vez, não é necessário executar outras vezes)
chmod +x localiza_id_covid.sh

3- execute o script e siga os pricedimento do script:
./localiza_id_covid.sh



