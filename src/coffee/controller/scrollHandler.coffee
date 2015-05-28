EventDispatcher = require "../util/eventDispatcher"
Throttle = require "../util/throttle"
instance = null
  
class ScrollHandler extends EventDispatcher
  constructor: -> super()

  exec: ->
    _throttle = new Throttle 100

    $( window ).on "scroll", =>
      _throttle.exec => @dispatch "SCROLLED", this

  off: -> $( window ).off "scroll"

getInstance = ->
  if !instance
    instance = new ScrollHandler()
  return instance

module.exports = getInstance
