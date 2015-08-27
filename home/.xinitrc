#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
xmodmap .Xmodmaprc
# dual monitor
xrandr --output LVDS --auto
xrandr --output HDMI-0 --auto --right-of LVDS
xrandr --output VGA-0 --auto --right-of LVDS

exec awesome --no-argb
