class Ticker
  if window?.performance?.now?
    getNow = ->
      window.performance.now()
  else
    getNow = ->
      Date.now()

  if window.requestAnimationFrame?
    window.requestAnimFrame = window.requestAnimationFrame
  else if window.webkitRequestAnimationFrame?
    window.requestAnimFrame = window.webkitRequestAnimationFrame
  else if window.mozRequestAnimationFrame?
    window.requestAnimFrame = window.mozRequestAnimationFrame
  else
    window.requestAnimFrame =
      ( callback )-> window.setTimeout callback, 1000 / 60

  constructor: ->
    @listeners = {}

    ################################
    # PRIVATE
    ################################
    _renderer = =>
      for name of @listeners
        @listeners[ name ]()
      window.requestAnimFrame _renderer

    _renderer()

  listen: ( name, func )->
    @listeners[ name ] = func

  clear: ( name )->
    if name?
      delete @listeners[ name ]
    else
      @listeners = {}

getInstance = ->
  if !instance
    instance = new Ticker()
  return instance

module.exports = getInstance
