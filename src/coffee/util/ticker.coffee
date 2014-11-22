class Ticker
  data = {}
  fps_counter = 0
  if global?.performance?.now?
    getNow = ->
      global.performance.now
  else
    getNow = ->
      Date.now
  now = getNow()
  interval = fps = 0
  listeners = []
  startTime = now
  prevTime = now
  prevSecondTime = now

  constructor: ->
    @setFps 30
    timer()

  setFps: ( _fps )->
    fps = _fps
    interval = 1000 / _fps

  listen: ( callback )->
    listeners.push callback

  timer = ->
    now = getNow()
    data.runTime = now - startTime
    data.delta = now - prevTime
    prevTime = now

    fps_counter += 1
    if fps_counter == fps
      data.measuredFps = fps /
                         ( ( now - prevSecondTime ) / 1000 )
      prevSecondTime = now
      fps_counter = 0

    for i of listeners
      listeners[ i ] data
    setTimeout timer, interval

getInstance = ->
  if !instance
    instance = new Ticker()
  return instance

module.exports = getInstance
