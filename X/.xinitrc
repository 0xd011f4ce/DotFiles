exec xrandr --output DP-3 --mode 2560x1440 --right-of HDMI-1 &
exec setxkbmap -layout gb &
exec doas bluealsad -p a2dp-sink -p a2dp-source --initial-volume=20 &
exec ~/.xsetrootrc &
exec dbus-run-session dwm
