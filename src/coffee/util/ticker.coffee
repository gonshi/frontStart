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
    @now = @startTime = @prevTime =
    @prevSecondTime = getNow()

    @listeners = []
    @data = {}
    @fps_counter = 0

    ################################
    # PRIVATE
    ################################
    _renderer = =>
      @now = getNow()
      @data.runTime = @now - @startTime
      @data.delta = @now - @prevTime
      @prevTime = @now

      @fps_counter += 1
      if @fps_counter == @FPS
        @data.measuredFps = @FPS /
                            ( ( @now - @prevSecondTime ) / 1000 )
        @prevSecondTime = @now
        @fps_counter = 0

      for listener in @listeners
        listener @data
      window.requestAnimFrame _renderer

    _renderer()

  listen: ( callback )->
    @listeners.push callback

  clear: ->
    @listeners = []

  stop: ->
    window.clearTimeout @timeout

getInstance = ->
  if !instance
    instance = new Ticker()
  return instance

module.exports = getInstance
