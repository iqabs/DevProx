# [MastersDev](https://telegram.me/MastersDev)

[![https://gitter.im/SEEDTEAM/TeleSeed](https://badges.gitter.im/MastersDev/MastersDevelpers.svg)](https://gitter.im/MastersDev/MastersDevelpers?utm_source=share-link&utm_medium=link&utm_campaign=share-link)

**An advanced and powerful administration bot based on [yagop/telegram-bot](https://github.com/yagop/telegram-bot)**.
# Features

* **A powerful antispam system with custom sensitivity for each group**
* **Multiple realms (admin groups)**
* **Recalcitrant to any kind of spamming (X/Y bots, name/photo changers, etc.)**
* **Global banning**
* **Broadcast to all groups**
* **Group and  links**
* **Kick, ban and unban by reply**
* **Groups, ban and global ban list**
* **Logging anything that happens in a group**
* **Invitation by username**
* **Group administration via private messages**
* **Only mods, owner and admin can add bots in groups**
* **Arabic lock**
* **Lock TgService**
* **Chat list**
* **And more!**


* * *

# Commands
#### just send !help

# Installation

```sh
# Install dependencies.
# Tested on Ubuntu 14.04. For other OSs, check out https://github.com/yagop/telegram-bot/wiki/Installation

sudo apt-get update

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev

sudo apt-get upgrade

redis-server

# Let's install the bot.
git clone https://github.com/Masterdev2v/MEero.git
cd MEero
chmod +x launch.sh
./launch.sh install
./launch.sh # Enter a phone number & confirmation code.
```
### One command
To install everything in one command (useful for VPS deployment) on Debian-based distros, use:
```sh
#https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get update; sudo apt-get upgrade -y --force-yes; sudo apt-get dist-upgrade -y --force-yes; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf -y --force-yes && git clone https://github.com/Masterdev2v/MEero.git && cd MEero && chmod +x launch.sh && ./launch.sh install && ./launch.sh
```

* * *

### Realm configuration

After you run the bot for first time, send it `!id`. Get your ID and stop the bot.

Open ./data/config.lua and add your ID to the "sudo_users" section in the following format:
```
  sudo_users = {
    0,
    YourID
  }
```
**Creating a LOG SuperGroup**
	-For GBan Log

	1. Create a group using the `!creategroup` command.
	2. Add two members or bots, then use `#super` to convert to a SuperSroup.
	3.and use `#modadd` to add groups to lists 
    4. Use the `#addlog` command and your ***LOG SuperGroup(s)*** will be set.
	# Note: you can set multiple Log SuperGroups


* * *

# Masters Bot 2.1v 🔰

##### The advanced administration bot based on Tg-Cli. 🌐

##### It was built on a platform TeleSeed after it has been modified.🔧🌐

# Developer🔰
### [@iDev1](https://telegram.me/iDev1)

# Special thanks to😋❤️

#### * Oscar
#### * Mico 
#### * Mouamle
#### * TeleSeed Team
#### * DBTeam
# Our channels 😍👍
#### [@MastersDev](https://telegram.me/OSCARBOTv2)🌚⚠
#### [@OSCARBOTv2](https://telegram.me/Malvoo)🌚🔌
#### [@MouamleAPI](https://telegram.me/MouamleAPI)🌚🔩
#### [@Malvoo](https://telegram.me/MastersDev)🌚🔧
 
# My YouTube Channel
#### [YouTube](https://www.youtube.com/channel/UCKsJSbVGNGyVYvV5B2LrUkA)
