%module binding
// swig -I/usr/include/ImageMagick -cffi wand.i 
%insert("lisphead") %{
(in-package :cl-wand)
%}

%{
#include <stdio.h>
#include <stdlib.h>
#include "wand/MagickWand.h"
#include "magick/ImageMagick.h"
%}
%{
%}
%include "magick/MagickCore.h"
%include "magick/magick-type.h"
%include "magick/animate.h"
%include "magick/annotate.h"
%include "magick/artifact.h"
%include "magick/blob.h"
%include "magick/cache.h"
%include "magick/cache-view.h"
%include "magick/cipher.h"
%include "magick/client.h"
%include "magick/coder.h"
%include "magick/color.h"
%include "magick/colorspace.h"
%include "magick/compare.h"
%include "magick/composite.h"
%include "magick/compress.h"
%include "magick/configure.h"
%include "magick/constitute.h"
%include "magick/decorate.h"
%include "magick/delegate.h"
%include "magick/deprecate.h"
%include "magick/display.h"
%include "magick/distort.h"
%include "magick/draw.h"
%include "magick/effect.h"
%include "magick/enhance.h"
%include "magick/exception.h"
%include "magick/fx.h"
%include "magick/gem.h"
%include "magick/geometry.h"
%include "magick/hashmap.h"
%include "magick/identify.h"
%include "magick/image.h"
%include "magick/layer.h"
%include "magick/list.h"
%include "magick/locale_.h"
%include "magick/log.h"
%include "magick/magic.h"
%include "magick/magick.h"
%include "magick/matrix.h"
%include "magick/memory_.h"
%include "magick/module.h"
%include "magick/mime.h"
%include "magick/monitor.h"
%include "magick/montage.h"
%include "magick/option.h"
%include "magick/paint.h"
%include "magick/pixel.h"
%include "magick/prepress.h"
%include "magick/profile.h"
%include "magick/property.h"
%include "magick/quantize.h"
%include "magick/quantum.h"
%include "magick/registry.h"
%include "magick/random_.h"
%include "magick/resample.h"
%include "magick/resize.h"
%include "magick/resource_.h"
%include "magick/segment.h"
%include "magick/shear.h"
%include "magick/signature.h"
%include "magick/splay-tree.h"
%include "magick/stream.h"
%include "magick/statistic.h"
%include "magick/string_.h"
%include "magick/timer.h"
%include "magick/token.h"
%include "magick/transform.h"
%include "magick/threshold.h"
%include "magick/type.h"
%include "magick/utility.h"
%include "magick/version.h"
%include "magick/xml-tree.h"
%include "magick/xwindow.h"

%include "wand/MagickWand.h"
%include "wand/animate.h"
%include "wand/compare.h"
%include "wand/composite.h"
%include "wand/conjure.h"
%include "wand/convert.h"
%include "wand/deprecate.h"
%include "wand/display.h"
%include "wand/drawing-wand.h"
%include "wand/identify.h"
%include "wand/import.h"
%include "wand/magick-image.h"
%include "wand/magick-property.h"
%include "wand/magick-wand.h"
%include "wand/magick_wand.h"
%include "wand/mogrify.h"
%include "wand/montage.h"
%include "wand/pixel-iterator.h"
%include "wand/pixel-view.h"
%include "wand/pixel-wand.h"
%include "wand/stream.h"
