device_re="\b.+id=([0-9]+).+\b"

if [ $# -eq 1 ] ; then
    if [[ $(xinput --list | grep $1) =~ $device_re ]] ; then
        id="${BASH_REMATCH[1]}"
        status=$(xinput list-props 16 | grep "Device Enabled" | grep -o "[01]$")
        xinput set-prop $id "Device Enabled" $((1-$status))
    else
        echo "Error: No xinput device matching '$1'"
    fi
else
    echo "Usage: xinput-toggle.sh <device-name>"
fi

