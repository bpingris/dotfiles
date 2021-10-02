# Dotfiles Benoît Pingris

This repository contains useful informations about my setup.

- fish (with fisher)
- neovim 0.5
- bspwm

![](https://raw.githubusercontent.com/bpingris/dotfiles/master/images/desktop_example.png)


#### Disable power button

Edit the `/etc/systemd/logind.conf`, uncomment the `HandlePowerKey` and set it to "ignore"

#### Enable the touchpad click

Do not use the `xinput` commands, wont work on every machine as devices' ID won't be the same.
But, do the following:
- create a new file `/etc/X11/xorg.conf.d/90-touchpad.conf`
- add the following:
```
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
Option "TappingButtonMap" "lrm"
EndSection
```
