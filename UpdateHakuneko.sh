#!/bin/bash
#Self-update HakuNeko script made by Juanma Cruz Blazquez alias Darruko
#This script requires 7z to work. It can be installed by `sudo apt-get install p7zip-full`

#Contact: juanma.cruzblazquez@gmail.com

temp="./Temp"
ubicacion="$HOME/.cache/hakuneko-desktop"

if ! test -d $temp; then
	mkdir $temp
fi

wget -q -O "$temp/Temp" http://static.hakuneko.download/0.4.0/latest
version=`cat $temp/Temp | cut -d "." -f 1`

if ! test -d $ubicacion; then
	mkdir $ubicacion
fi

if ! test -f $ubicacion/version; then
	touch $ubicacion/version
fi

version_actual=`cat $ubicacion/version`

if [ "$version_actual" != "$version" ];then
	rm -r $ubicacion
	mkdir $ubicacion
	wget -q -O "$temp/Version.zip" http://static.hakuneko.download/0.4.0/$version.zip 
	7z x $temp/Version.zip -O$ubicacion
	echo $version >> $ubicacion/version
	rm $temp/Version.zip
else
	echo "No hace falta actualizar, version $version"

fi
rm $temp/Temp
rmdir $temp

/usr/lib/hakuneko-desktop/hakuneko
