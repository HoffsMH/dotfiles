# Pecan

Pecan is a bar for macOS.  It was built to be highly configurable and — by default — reports the current workspace, network bandwidth, date, battery percentage and time.

![Screenshot 1](/screenshots/3.jpg)

![Screenshot 2](/screenshots/4.jpg)

![Screenshot 3](/screenshots/1.jpg)

![Screenshot 4](/screenshots/2.jpg)

## Instructions

Pecan requires [Übersicht](http://tracesof.net/uebersicht/).  Once Übersicht is installed, you can clone this repository to where your Übersicht bars are placed.

```
git clone https://github.com/zzzeyez/Pecan.git $HOME/Library/Application\ Support/Übersicht/widgets/Pecan
```

If Übersicht is running, then the bar should appear.

## Customization & Themes

#### Load themes

Pecan includes a tool `pecan-style` to allow users to save and load themes.  There are, by default, a few included themes.

To use the tool `pecan-style`, first you must tell it where your Übersicht folder is located:

```
sed -i -e "s~/Users/zzzeyez/scripts/uber~HOME/Library/Application\ Support/Übersicht/widgets~g" "$HOME/Library/Application\ Support/Übersicht/widgets/Pecan/pecan-style"
```

And then install the tool:

```
mv "$HOME/Library/Application\ Support/Übersicht/widgets/Pecan/pecan-style" "/usr/local/bin"
```

Then if you want to load the Fillmore theme,  you do it like so:

```
pecan-style --load fillmore
```

You can also save and list themes by — respectively — using `--save` and `--list`. 

#### Create themes

Because Pecan is styled using CSS3 variables, the top lines of `style.css` can easily be edited to change properties like opacity, alignment, padding, colors and more.  If you are using this bar with Wal, then you should be editing `scss/style.scss` instead.

#### Pecan + Xanthia

If `Xanthia` is installed then it will now use `Pecan`'s CSS/SCSS files.

## Optional features
  
#### Network Bandwidth

Current download and upload speeds may be shown in the 2nd-to-left element via Ifstat.  If Ifstat is not found, then the current wifi network will be displayed instead.  To install Ifstat via Homebrew:

```
brew install ifstat
```
  
#### Workspaces

Current workspace ID can be shown on the left element if [ChunkWM](https://github.com/koekeishiya/chunkwm) is installed, otherwise a power symbol will be shown instead.  To install ChunkWM:
  
```
brew tap crisidev/homebrew-chunkwm
brew install chunkwm
````

## Wal

Pecan can pull a color palette generated by Wal using Sassc.  I have included a script, `wal-set`, that will perform this.
 
To install Sassc:

```
brew install sassc
```
  
And then you must change the username at the top of `scss/style.scss` to that of your own:

```
sed -i -e "s/zzzeyez/$USER/g" ~/Library/Application\ Support/Übersicht/widgets/Pecan/scss/style.scss
```
  
Now you can run the script to use Wal's palettes:

```
bash ~/Library/Application\ Support/Übersicht/widgets/Pecan/wal-set
```
