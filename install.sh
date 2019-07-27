#！/usr/bin/env bash

# system update
apt update && apt upgrade

# OpenMeetings 4.0.9 need Java 1.8 to work.
apt install openjdk-8-jdk openjdk-8-jdk-headless -y
# plugin for web:
apt install icedtea-netx -y
# May be you have different java version ,please choose java version
update-alternatives --config java &&

# If you need to add repository,need to install software-properties-common package
apt install software-properties-common -y 
# Add repository and install libreoffice
dd-apt-repository ppa:libreoffice/ppa &&
apt update
apt install libreoffice -y 

# ImageMagick, will work the image files, png, jpg, gif
apt install imagemagick libjpeg62 zlib1g-dev -y
# Sox, work the sound.
apt install sox -y
# OpenMeetings even need Adobe Flash Player for cam and audio. Openmeeting 5.0.0version didn't neet flash
apt install flashplugin-installer -y

# Install some paquets and libraries
apt -y --force-yes install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texi2html zlib1g-dev nasm libx264-dev cmake mercurial libopus-dev curl git vlc unzip make build-essential wget nmap
apt install libmp3lame-dev -y
apt install libvpx-dev -y 

# copy some file to home diretory,because offical bash script useless
cp -r ffmpeg_sources ~
cd ~/ffmpeg_sources

# I modified this script 
bash ffmpeg_UbunDebi.sh &&

# Install mariadb 
apt install mariadb-server
/etc/init.d/mysql start


mkdir /opt/red5409
cp apache-openmeetings-4.0.9.tar.gz /opt/red5409
cp mysql-connector-java-5.1.47.jar /opt/
cp red5-ubdeb2 /etc/init.d/
cd /opt/red5409

tar xzvf apache-openmeetings-4.0.9.tar.gz
mv apache-openmeetings-4.0.9.tar.gz /opt
chown -R nobody /opt/red5409
cd /opt
cp mysql-connector-java-5.1.47.jar /opt/red5409/webapps/openmeetings/WEB-INF/lib

chmod +x /etc/init.d/red5-ubdeb2


