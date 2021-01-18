# Intro

This is a collection of scripts that I use to manage my photo library.

Parts of the scripts were found on stackoverflow.com and stackexchange.com

# backupphotosandvideos.sh

This script can convert a library of Canon RAW and TIFF files into JPG.
As a bonus, this will re-encode the Canon video files to make them smaller (some quality loss is expected)
All unsupported files will be copied as is


## Supported OS

This script is currently using Apple SIPS and avconvert, so it can be run on a Mac only. 
In theory, SIPS can be replaced by imagemagick, but the resulting image quality is not that great (I didn't have time to figure out how to make it better). AVconvert can be replaced with ffmpeg, but, again, avconvert seems to be producing better quality files.

## Usage

Modify the currentdir in the script to point to the directory where your source files are
Modify the basedir to point to the directory where you want your destination files.

Basedir doesn't have to exist, the script will create it if it's not there.

# sizebyalltypes.sh

This script lists the total size of all files in the current directory by type. Just cd to the directory you want it to work on and run this script (you can put it into a directory in your $PATH, or just type the full path to this script).

```
ks@MBP ~/AllPhotozJPG/2020 % ~/PhotoScripts/sizebyalltypes.sh
.heic  212MiB
.jpeg  1.1GiB
.jpg  5.0GiB
.mov  2.2GiB
.on1   65KiB
.psd   27MiB
.xmp  7.1KiB
```

# Warranty

No warranty is provided. I'm not responsible for any consequences of you using or not using my scripts.
