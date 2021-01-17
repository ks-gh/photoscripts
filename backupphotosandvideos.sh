#!/bin/bash

currentdir="~/Documents/Photos"
basedir="~/Documents/AllJPG"

cd "$currentdir"
totalfiles=$(find . -type f -name '*' | wc -l)
echo "TOTAL FILES: $totalfiles"
i=1
find . -type f -name '*' -print0 |
while IFS= read -r -d '' file; do
    ##printf '%s\n' "$file"
    dir=$(dirname "$file")
    relDir="${dir:1}"
    basename=$(basename -- "$file")
    mkdir -p "$basedir/$relDir"
    echo $relDir
    echo $basename
    if [ "${basename: -4}" == ".CR2" ] || [ "${basename: -4}" == ".cr2" ] || [ "${basename: -4}" == ".TIF" ] || [ "${basename: -5}" == ".TIFF" ] || [ "${basename: -4}" == ".tif" ] || [ "${basename: -5}" == ".tiff" ]; then 
      echo "$i of $totalfiles converting RAW $file"
      sips -Z 4752 -s format jpeg "$currentdir/$relDir/$basename" --out "$basedir/$relDir/$basename.jpg"
    elif [ "${basename: -4}" == ".AVI" ] || [ "${basename: -4}" == ".MOV" ] || [ "${basename: -4}" == ".avi" ] || [ "${basename: -4}" == ".mov" ]; then
        size=$(mediainfo --Output="Video;%Width%,%Height%" "$currentdir/$relDir/$basename")
        newname="$basedir/$relDir/${basename}c.MOV" 
        if [ "$size" = "1920,1080" ]; then
          printf "$i of $totalfiles converting 1920x1080 $file";
          avconvert --source "$currentdir/$relDir/$basename" --preset Preset1920x1080 --output "$newname";
        elif [ "$size" = "1280,720" ]; then
          printf "$i of $totalfiles converting 1280x 720 $file";
          avconvert --source "$currentdir/$relDir/$basename" --preset Preset1280x720 --output "$newname";
        elif [ "$size" = "3840,2160" ]; then
          printf "$i of $totalfiles converting 3840x2160 $file";
          avconvert --source "$currentdir/$relDir/$basename" --preset Preset3840x2160 --output "$newname";
        elif [ "$size" = "640,480" ]; then
          printf "$i of $totalfiles converting 640 480 $file";
          avconvert --source "$currentdir/$relDir/$basename" --preset Preset640x480 --output "$newname";
        else
          printf "$i of $totalfiles size is $size, copying as is $file"
          cp "$currentdir/$relDir/$basename" "$basedir/$relDir/$basename"
        fi
    else 
      echo "$i of $totalfiles copying as is $file"
      cp "$currentdir/$relDir/$basename" "$basedir/$relDir/$basename"
    fi
  ((i=i+1))
done
