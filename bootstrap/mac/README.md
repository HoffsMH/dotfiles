### Actions:
  - remove every item from dock
  - make dock small
  - auto hide dock
  - auto hide menu bar
  - keyboard -> key repeat fast
  - function keys to actually be function keys
  - battery in menu bar -> show percentage
  - open display preferences -> show mirroring options in menu bar - disabled
  - trackpad -> disabled force click
    -> secondary click with 2 fingers
    -> scroll direction -> normal
    -> smart zoom disabled
    -> disabled all "more gestures"
  - date and time preferences
  - network and name the computer

## ./run_after_install.sh

### work on linking everything in dotfiles (you wont get everything first time)
  - Open apps for first time to generate file structures if you need to remember Or see where stuff goes

### Brew services that need to be started
  - Docker
  - Postgres
  - Redis
  - Chunkwm
  - Skhd
  - syncthing

## Misc things to do after brew install
  - switch mission control to hyper U
  - fully enable chunkwm by restarting and disabling csrutil `csrutil disable`
  - `sudo chunkwm --install-sa`
  - `chunkwm --load-sa`

## Firefox dev edition 
  - chrome settings -> password -> offer to save password off
  - chrome extensions
    -- extensions
      - ublock
      - json formatter
      - edit this cookie
      - vimium
      - duck duck go

## Pcloud and 1Password
  - download pcloud and login
    - hook up vault, yes to 1passowrd mini
    - restore ssh keys from 1Password if needed

## vault retrieval chart

-> phone via syncthing
-> pi via vpn and syncthing
-> backblaze backup
-> physical disk if available


## Proton email retrieve software keys
  - sublime
    - immediately download package control
    - wire up settings and package settings and keybinding files

  - Alfred
    - will probably have to tweak settings more -really annoying should figure this out
  - switch out spotlight key bind with Alfred

## Github
- github login

## Ending Misc
  - App Store
    - daisy disk since I already bought it
  - check out optional brew list
