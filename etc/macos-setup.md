## OS X-specific setup notes

**GUI file opener**: OS X provides a default `open` program to open files in
their default MIME handler. Lots of terminal utilities only account for
`xdg-open`; we can fix these instances (despite the different API) by
symlinking `xdg-open` to `open`
```sh
sudo ln -sf /usr/bin/open /usr/local/bin/xdg-open
```
