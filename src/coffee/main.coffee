###!
  * Main Function
###

if window._DEBUG
  if Object.freeze?
    window.DEBUG = Object.freeze window._DEBUG
  else
    window.DEBUG = state: true
else
  if Object.freeze?
    window.DEBUG = Object.freeze state: false
  else
    window.DEBUG = state: false

$ ->
  if window.isAndroid
    _viewport = parseInt( document.querySelector( 'meta[name="viewport"]' )
                .getAttribute( "content" ).match( /width=(.*?),/ )[ 1 ] )
    window.onload = -> document.body.style.zoom = window.innerWidth / _viewport
