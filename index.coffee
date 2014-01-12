
createCanvas = (w, h) ->
  canvas = document.createElement 'canvas'
  canvas.setAttribute 'width', w
  canvas.setAttribute 'height', h

  context = canvas.getContext '2d'

  return [canvas, context]

repeat = (sourceImage, timesX, timesY) ->
  destW = sourceImage.width * timesX
  destH = sourceImage.height * timesY

  [canvas, context] = createCanvas destW, destH

  pattern = context.createPattern sourceImage, 'repeat'

  context.fillStyle = pattern
  context.fillRect 0, 0, destW, destH

  return canvas.toDataURL()

# make the image bigger or smaller
# note from spec http://www.w3.org/html/wg/drafts/2dcontext/html5_canvas_CR/#drawing-images-to-the-canvas
# "This specification does not define the algorithm to use when scaling the image, if necessary."
# which makes it mostly useless
scale = (sourceImage, scaleX, scaleY) ->
  destW = sourceImage.width * scaleX
  destH = sourceImage.width * scaleY

  [canvas, context] = createCanvas destW, destH

  context.drawImage sourceImage, 0, 0, destW, destH

  return canvas.toDataURL()

crop = (sourceImage, ox, oy, ow, oh) ->
  sx = ox || 0
  sy = oy || 0

  destW = sourceImage.width - (ow || 0) - sx
  destH = sourceImage.height - (oh || 0) - sy

  sw = destW
  sh = destH

  [canvas, context] = createCanvas destW, destH

  console.log(sx,sy,sw,sh,0,0,destW,destH)
  context.drawImage sourceImage, sx, sy, sw, sh, 0, 0, destW, destH

  return canvas.toDataURL()

module.exports = { repeat, scale, crop }
