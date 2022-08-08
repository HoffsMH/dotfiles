
# https://unix.stackexchange.com/questions/9496/looping-through-files-with-spaces-in-the-names
IFS=$'\n'

porcelaindir="$HOME/personal/dotfiles/links"
files=$(find $porcelaindir -name '*')
h="$HOME"

for i in $files
do
  if [ -f "$i" ]
  then
    dirn=$(dirname $i)
    basen=$(basename $i)
    newdirn=${dirn/$porcelaindir}

    newlink="$h$newdirn/$basen"

    if [ ! -f "$newlink" ]
    then

      echo "$newlink"

      mkdir -p "$h$newdirn"

      # subtract read and write from
      # group and others
      chmod go-rwx "$i"

      # add read and write to
      # owner
      chmod u+rw "$i"

      # link real file to new link location
      ln -sf "$i" "$newlink"
    fi
  fi
done

"$HOME/personal/dotfiles/bootstrap/links/cleanup.sh"
