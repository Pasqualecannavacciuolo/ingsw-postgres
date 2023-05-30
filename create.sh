#!/bin/bash

# Dichiarazione dei colori
LIGHT_GREEN='\033[1;32m'
LIGHT_RED='\033[1;31m'
NC='\033[0m' # No colore

# Identifico il Sistema Operativo
platform='unknown'
OS=$(uname)
if [[ "$OS" == 'Darwin' ]]; then
   platform='mac'
elif [[ "$unamestr" != 'Darwin' ]]; then
   platform='linux'
fi

# Linea di DEBUG
#echo $platform

# Installazione requisiti
if [[ "$platform" != 'mac' ]]; then
    echo "Entri anche qui sfigato"
    sudo apt install jp2a python3
elif [[ "$platform" == 'mac' ]]; then
   echo -e  "✅ ${LIGHT_GREEN} Sei su Mac nulla da fare per ora...${NC}"
fi
#sudo apt install jp2a python3

# Aggiungo le librerie python
pip install gdown docker --user

# Creo l'immagine di PepeTheFrog
jp2a Pepe_small.png --colors --width=25 --height=15

echo "📣 Processo di creazione del container 🐳Docker avviato"

echo "⌛️ Ottengo la cartella pgdata..."
mkdir data_folder
cd data_folder
git clone https://github.com/Pasqualecannavacciuolo/pgdata_repo.git
cd pgdata_repo
echo $(pwd)
python3 ../../gdrive_pgdata.py
DIR=pgdata
if [ ! -d "$DIR" ];
then
	echo -e "🔴 ${LIGHT_RED} Cartella non ottenuta${NC}"
else
	echo -e "✅ ${LIGHT_GREEN}Cartella ottenuta con successo${NC}"
fi

# Setto la proprietà della cartella pgdata sull'attuale utente
USER=$(whoami)
sudo chown -R $USER pgdata
cd .. ..


echo "⌛️ Avvio del container 🐳Docker..."

# Creo il container per PostgreSQL
cd ..
docker run --name INGSW-postgres-bash -p 5432:5432 -e POSTGRES_PASSWORD=progetto123 -e POSTGRES_DB=ristorante -e POSTGRES_USER=pasquale -e PGDATA=/pgdata -v $(pwd)/data_folder/pgdata_repo/pgdata:/pgdata -d postgres
echo $(pwd)
containerIsRunning=$(python3 container_is_running.py)
if [ "$containerIsRunning" = "is running" ];
then
	echo -e "✅ ${LIGHT_GREEN}Container creato ed attualmente in esecuzione${NC}"
else
	echo -e "🔴 ${LIGHT_RED} Container non creato correttamente, rivedi il comando di creazione${NC}"
fi
