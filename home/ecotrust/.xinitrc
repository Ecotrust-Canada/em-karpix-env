xset -dpms
xset s off
hsetroot -center /opt/xorg/share/wallpaper.bmp
xsetroot -cursor_name arrow
xset fp+ /opt/xorg/share/fonts/X11/TTF
xset fp rehash

LINE=`xrandr -q | grep Screen`
WIDTH=`echo ${LINE} | awk '{ print $8 }'`
HEIGHT=`echo ${LINE} | awk '{ print $10 }'`
HEIGHT=${HEIGHT:0:-1}

#echo "${WIDTH} ${HEIGHT}" > ${EM_RESOLUTION}

while true; do
#	/opt/firefox/firefox -private -no-remote -new-instance -new-window http://localhost:8081/em/ -width ${WIDTH} -height ${HEIGHT}
#	/bin/rm -rf /tmp/user/.mozilla
#	/bin/cp --no-dereference --preserve=all -r /home/user/.mozilla /tmp/user/
	/opt/opencpn/bin/opencpn -fullscreen
done
