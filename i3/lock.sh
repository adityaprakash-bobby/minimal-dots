#!/bin/bash

# i3lock blurred screen inspired by /u/patopop007 and the blog post
# http://plankenau.com/blog/post-10/gaussianlock

# Dependencies:
# i3lock
# ImageMagick
# maim (scrot depricated in Fedora 31)

IMAGE=/tmp/i3lock.png
SCREENSHOT="maim $IMAGE" # 0.46s

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
BLURTYPE="2x3" # 2.92s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -resize 50% $IMAGE
convert $IMAGE -blur $BLURTYPE $IMAGE
convert $IMAGE -resize 200% $IMAGE
i3lock -i $IMAGE
rm $IMAGE
