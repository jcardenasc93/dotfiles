# /usr/bin/sh
grim -g "$(slurp)" - | satty -f - --output-filename - | wl-copy -t image/png
