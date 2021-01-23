if test -f "$HOME/.Xresources"; then
    echo "merging Xterm config..."
    xrdb -merge "$HOME/.Xresources"
fi

exec i3
