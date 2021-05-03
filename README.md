# Renee's dotfiles
i write these so i can write the code

## OS X-specific setup notes

**GUI file opener**: OS X provides a default `open` program to open files in
their default MIME handler. Lots of terminal utilities only account for
`xdg-open`; we can fix these instances (despite the different API) by
symlinking `xdg-open` to `open`
```sh
sudo ln -sf /usr/bin/open /usr/local/bin/xdg-open
```
## Linux-specific setup notes

**Disable Speaker/Beep**: The following will blacklist the PC speaker kernel module.
```sh
if [ ! -f /etc/modprobe.d/nobeep.conf ]; then
  echo 'blacklist pcspkr' | sudo tee /etc/modprobe.d/nobeep.conf
fi
```
