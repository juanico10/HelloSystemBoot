# Enviar notificación al Telegram del arranque del sistema
Para poder recibir los mensajes en el Telegram, debes obtener el Token y chat_id de tu bot de telegram, puedes solicitarlos aquí desde la App de Telegram:
- Bot token: <a href="https://t.me/botfather"><img src="https://img.shields.io/badge/Link-2aa8ff.svg?style=flat" alt="Link"></a>
- Chat_ID: <a href="https://t.me/myidbot"><img src="https://img.shields.io/badge/Link-2aa8ff.svg?style=flat" alt="Link"></a>

![alt text](https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hellotelegram.png)

Empezamos a instalar el bot de inicio. Para que funcione necesita permisos, por lo que instalar en el usuario ROOT:
### Instalar los paquetes y actualizamos el sistema
~~~~shell
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install curl -y
~~~~

### Edita el archivo hello.service para cambiar la ruta donde tienes el script hello.sh
<p>Pueden descargar el archivo del servicio directamente del link: <a href="https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hello.service"><img src="https://img.shields.io/badge/Link-2aa8ff.svg?style=flat" alt="Link"></a></p>
<p>Modificamos el archivo para añadir la siguiente ruta, donde irá el <code>hello.sh</code>code>:</p>
<p>Podemos modificar el tiempo (en segundos) el retraso en ejecución:</p>

~~~~shell
ExecStartPre=/bin/sleep 60
ExecStart=/usr/bin/bash	/root/scripts/hello.sh
~~~~
### Copiar el archivo hello.service y asignarle los permisos 0644
~~~~shell
cp hello.service /etc/systemd/system/ && \
chmod 0644 /etc/systemd/system/hello.service
~~~~
### Restart service, and enabled
~~~~shell
systemctl enable hello.service && \
systemctl start hello.service && \
systemctl daemon-reload
~~~~
### Edita el script hello.sh, para añadir tu token de bot, y tu chat_id, renombra el script elegido a hello.sh
<p>Pueden descargar el archivo del script directamente del link: <a href="https://github.com/JuanRodenas/HelloSystemBoot/blob/main/hello.sh"><img src="https://img.shields.io/badge/Link-2aa8ff.svg?style=flat" alt="Link"></a></p>
<p>Modificamos el archivo <code>hello.sh</code> y modicamos lo siguiente:</p>

~~~~shell
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~
### Asigna los permisos a+x
~~~~shell
chmod a+x /root/scripts/hello.sh
~~~~
### Ready!
