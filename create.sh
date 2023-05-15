#!/bin/bash

# Dichiarazione dei colori
LIGHT_GREEN='\033[1;32m'
LIGHT_RED='\033[1;31m'
NC='\033[0m' # No colore

# Installazione requisiti
sudo apt install jp2a python3

# Aggiungo le librerie python
pip install gdown docker

# Creo l'immagine di PepeTheFrog
jp2a Pepe_small.png --colors --width=25 --height=15

echo "📣 Processo di creazione del container 🐳Docker avviato"

echo "⌛️ Ottengo la cartella pgdata..."
python3 gdrive_pgdata.py
DIR=./pgdata
if [ ! -d "$DIR" ];
then
	echo -e "🔴 ${LIGHT_RED} Cartella non ottenuta"
else
	echo -e "✅ ${LIGHT_GREEN}Cartella ottenuta con successo${NC}"
fi

# Setto la proprietà della cartella pgdata sull'attuale utente
USER=$(whoami)
sudo chown -R $USER pgdata

echo "⌛️ Avvio del container 🐳Docker..."

# Creo il container per PostgreSQL
docker run --name INGSW-postgres-bash -p 5432:5432 -e POSTGRES_PASSWORD=progetto123 -e POSTGRES_DB=ristorante -e POSTGRES_USER=pasquale -e PGDATA=/pgdata -v $(pwd)/pgdata:/pgdata -d postgres

containerIsRunning=$(python3 container_is_running.py)
if [ "$containerIsRunning" = "is running" ];
then
	echo -e "✅ ${LIGHT_GREEN}Container creato ed attualmente in esecuzione"
else
	echo -e "🔴 ${LIGHT_RED} Container non creato correttamente, rivedi il comando di creazione"
fi
