#!/bin/bash
primary=eDP-1
monitor1=DVI-I-2-2
monitor2=DVI-I-1-1
monitor2_rotation=right
resolution=1920x1080

# Monitor 1
xrandr --output $monitor1 --mode $resolution
xrandr --output $monitor1 --primary --right-of $primary

# Monitor 2
xrandr --output $monitor2 --mode $resolution
xrandr --output $monitor2 --rotate $monitor2_rotation --right-of $monitor1
