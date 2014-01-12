
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


module.exports = { repeat }
