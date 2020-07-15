#! bin/sh

# https://unix.stackexchange.com/questions/9496/looping-through-files-with-spaces-in-the-names
IFS=$'\n'

files=$(find $HOME/personal/dotfiles/samples -name '*')
h="$HOME"

for i in $files
do
  if [ -f "$i" ]
  then
    dirn=$(dirname $i)
    basen=$(basename $i)

    newdirn=${dirn/$HOME\/personal\/dotfiles\/samples/}

    if [ ! -f "$h$newdirn/$basen" ]
    then

      echo "$h$newdirn/$basen"
      mkdir -p "$h$newdirn"
      cp "$i" "$h$newdirn/$basen"
    fi
  fi
done
