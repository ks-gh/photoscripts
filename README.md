# Intro

This is a collection of scripts that I use to manage my photo library.

# backupphotosandvideos.sh

This script is intended for converting a large library of Canon RAW and TIFF files into JPG.
As a bonus, this will re-encode the Canon files into the 

## Supported OS

This script is currently using Apple SIPS and avconvert, so it can be run on a Mac only. 
In theory, SIPS can be replaced by imagemagick, but the resulting image quality is not that great (I didn't have time to figure out how to make it better). AVconvert can be replaced with ffmpeg, but, again, avconvert seems to be producing better quality files.

## Usage

Modify the currentdir in the script to point to the directory where your source files are
Modify the basedir to point to the directory where you want your destination files.

Basedir doesn't have to exist, the script will create it if it's not there.

# Warranty

No warranty is provided. I'm not responsible for any consequences of you using or not using my scripts.
