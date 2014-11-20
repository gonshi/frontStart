class Throttle
  constructor: ( minInterval )->
    @interval = minInterval
    @prevTime = 0
    @timer = ->
 
  exec: ( callback )->
    now = +new Date()
    delta = now - @prevTime

    clearTimeout( @timer )
    if delta >= @interval
      @prevTime = now
      callback()
    else
      @timer = setTimeout callback, this.interval

module.exports = Throttle
