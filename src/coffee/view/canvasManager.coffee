class CanvasManager
  constructor: ( $dom )->
    @canvas = $dom.get 0
    if !@canvas.getContext
      return undefined
    @ctx = @canvas.getContext "2d"

  resetContext: ( width, height )->
    @canvas.width = width
    @canvas.height = height

  clear: -> @ctx.clearRect 0, 0, @canvas.width, @canvas.height

  getImgData: ( x, y, width, height )->
    @ctx.getImageData x, y, width, height

  getImg: -> @canvas.toDataURL()

  getContext: -> @ctx

module.exports = CanvasManager
