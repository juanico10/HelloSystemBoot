# Send message notification Telegram on boot

### Install packages
~~~~
sudo apt update
sudo apt upgrade -y
sudo apt curl -y
~~~~

### Edit hello.service file to change the path where you have the hello.sh script
~~~~
ExecStart=/usr/bin/bash	/root/hello.sh
~~~~
### Copy the hello.service and assign it the permissions 0644
~~~~
cp hello.service /etc/systemd/system/
chmod 0644 /etc/systemd/system/
~~~~
### Edit the script hello.sh, to add your bot token, and your chat_id, rename the chosen script to hello.sh
~~~~
TOKEN_BOT="YOUR_TOKEN_BOT"
TOKEN_ID="YOUR_TOKEN_CHAT"
~~~~
### Assign it the permissions a+x
~~~~
chmod a+x /root/hello.sh
~~~~
### Ready!