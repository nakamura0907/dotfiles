swayidle -w timeout 300 'swaylock -f --clock --indicator' \
            timeout 600 'systemctl suspend' \
            before-sleep 'swaylock -f --clock --indicator' &