#!/bin/sh

WAND_DIR=/usr/include/ImageMagick/wand
MAGICK_DIR=/usr/include/ImageMagick/magick
TARGET_FILE=../binding.lisp
HEADERS="`find $WAND_DIR -name "*.h"` `find $MAGICK_DIR -name "*.h"`"

# cp
mkdir -p tmp
cd tmp
for i in $HEADERS
do
    cp $i .
done

# remove extern WandExport
find . -name "*.h" -exec sed -e "s/extern WandExport//g" -i {} \;
find . -name "*.h" -exec sed -e "s/WandExport//g" -i {} \;
find . -name "*.h" -exec sed -e "s/extern MagickExport//g" -i {} \;
find . -name "*.h" -exec sed -e "s/MagickExport MagickProgressMonitor//g" -i {} \;


# run swig
for i in $HEADERS
do
    current=`basename $i`
    swig -cffi -module $current -o $current $current
done

LISP_FILES=`find . -name "*.lisp"`
for i in $LISP_FILES
do
# remove the first 50 lines
    echo ";; `basename $i`" >> $TARGET_FILE
    tail -n +50 $i >> $TARGET_FILE
done

# rm -rf tmp
