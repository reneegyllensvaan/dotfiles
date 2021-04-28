## Linux-specific setup notes

**Disable Speaker/Beep**: The following will blacklist the PC speaker kernel module.
```sh
if [ ! -f /etc/modprobe.d/nobeep.conf ]; then
  echo 'blacklist pcspkr' | sudo tee /etc/modprobe.d/nobeep.conf
fi
```
