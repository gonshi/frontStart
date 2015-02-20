PI = Math.PI
sin = Math.sin

window.easeOutQuad = ( current_t, from, to, duration )->
  return to * sin( current_t / duration * ( PI / 2 ) ) + from

window.easeInQuad = ( current_t, from, to, duration )->
  current_t /= duration
  return to * current_t * current_t + from
