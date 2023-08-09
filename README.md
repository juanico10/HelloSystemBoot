# Enviar notificación al Telegram del arranque del sistema
Para poder recibir los mensajes en el Telegram, debes obtener el Token y chat_id de tu bot de telegram, puedes solicitarlos aquí desde la App de Telegram:
- Bot token: https://t.me/botfather
- Chat_ID: https://t.me/myidbot

![alt text](https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hellotelegram.png)

Empezamos a instalar el bot de inicio. Para que funcione necesita permisos, por lo que instalar en el usuario ROOT:
### Instalar los paquetes y actualizamos el sistema
~~~~
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install curl -y
~~~~

### Edita el archivo hello.service para cambiar la ruta donde tienes el script hello.sh
Descargar el servicio [hello.service](https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hello.service)
Creamos el archivo hello.service:
~~~~
nano hello.service
~~~~
Y modicamos la siguiente ruta, donde irá el hello.sh.sh:
~~~~
ExecStart=/usr/bin/bash	/root/scripts/hello.sh
~~~~
### Copiar el archivo hello.service y asignarle los permisos 0644
~~~~
cp hello.service /etc/systemd/system/ && \
chmod 0644 /etc/systemd/system/hello.service
~~~~
### Restart service, and enabled
~~~~
systemctl enable hello.service && \
systemctl start hello.service && \
systemctl daemon-reload
~~~~
### Edita el script hello.sh, para añadir tu token de bot, y tu chat_id, renombra el script elegido a hello.sh
Descargar el script [script hello.sh](https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hello.sh)
Creamos el archivo hello.sh:
~~~~
nano hello.sh
~~~~
Y modicamos lo siguiente:
~~~~
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~
### Asigna los permisos a+x
~~~~
chmod a+x /root/scripts/hello.sh
~~~~
### Ready!
