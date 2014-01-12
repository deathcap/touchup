
repeat = (sourceImage, timesX, timesY) ->
  destW = sourceImage.width * timesX
  destH = sourceImage.height * timesY

  canvas = document.createElement 'canvas'
  canvas.setAttribute 'width', destW
  canvas.setAttribute 'height', destH

  context = canvas.getContext '2d'

  pattern = context.createPattern sourceImage, 'repeat'

  context.fillStyle = pattern
  context.fillRect 0, 0, destW, destH

  return canvas.toDataURL()


module.exports = { repeat }
