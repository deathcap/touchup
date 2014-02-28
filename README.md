# touchup

quick & dirty image manipulation using HTML5 canvas

## Usage

    var touchup = require('touchup');

All methods return data URIs for the new image. Available methods:

    touchup.repeat(sourceImage, timesX, timesY)

Tiles the source image a number of times in each direction, for example 2x2:

![screenshot](http://i.imgur.com/JWMqygd.png "Screenshot")

    touchup.scale(sourceImage, scaleX, scaleY)

Resize an image up (`>1`) or down (`<1`) using browser-dependent scaling algorithm.

    touchup.scale(sourceImage, scaleX, scaleY, 'nearest-neighbor')

Resize an image with image smoothing disabled.

    touchup.crop(sourceImage, ox, oy, ow, oh)

Truncate the edges of an image by the given offsets (0 = no change).

    touchup.overlay(sourceImages, operation, alpha)

Draw the list of images in `sourceImages` on top of each other, in order,
using the given
[composite operation](http://www.w3.org/html/wg/drafts/2dcontext/html5_canvas_CR/#compositing)
(default "source-over") and alpha (default 1.0).

## Examples

`npm start`

## License

MIT

