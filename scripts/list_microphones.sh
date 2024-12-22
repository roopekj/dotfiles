# List IDs of possible audio input devices
pacmd list-sources | grep -e 'index:' -e device.string -e 'name:'
