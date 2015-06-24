instance = null

class Social
  exec: ->
    _type = {}
    for i in [ 0...arguments.length ]
      _type[ arguments[ i ] ] = true

    # facebook
    if _type.fb?
      _dom = document.querySelectorAll( ".fb-like" )
      for i in [ 0..._dom.length ]
        _dom[ i ].style.opacity = 1

      fjs = document.getElementsByTagName( "script" )[ 0 ]
      return if document.getElementById "facebook-jssdk"
      js = document.createElement "script"
      js.id = "facebook-jssdk"
      js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&" +
              "appId=1548831858693621&version=v2.0"
      fjs.parentNode.insertBefore js, fjs
    
    # twitter
    if _type.tweet?
      _dom = document.querySelectorAll( ".tweet" )
      for i in [ 0..._dom.length ]
        _dom[ i ].style.opacity = 1

      window.twttr = (->
        fjs = document.getElementsByTagName( "script" )[ 0 ]
        return if document.getElementById "twitter-wjs"
        js = document.createElement "script"
        js.id = "twitter-wjs"
        js.src = "https://platform.twitter.com/widgets.js"
        fjs.parentNode.insertBefore js, fjs
        if window.twttr?
          return window.twttr
        else
          return ( t =
            _e: []
            ready:  ( f )-> t._e.push f
          )
      )()

    # hatena
    if _type.hatena?
      _dom = document.querySelectorAll( ".hatena" )
      for i in [ 0..._dom.length ]
        _dom[ i ].style.opacity = 1

      j = document.createElement "script"
      j.type = "text/javascript"
      j.src = "https://b.st-hatena.com/js/bookmark_button.js"
      j.async = "async"
      j.charset = "utf-8"
      s = document.getElementsByTagName( "script" )[0]
      s.parentNode.insertBefore j, s

    # pocket
    if _type.pocket?
      _dom = document.querySelectorAll( ".pocket" )
      for i in [ 0..._dom.length ]
        _dom[ i ].style.opacity = 1

      if !document.getElementById "pocket-btn-js"
        j = document.createElement "script"
        j.id = "pocket-btn-js"
        j.type = "text/javascript"
        j.src = "https://widgets.getpocket.com/v1/j/btn.js?v=1"
        w = document.getElementById "pocket-btn-js"
        document.body.appendChild j

    # gplus
    if _type.gplus?
      _dom = document.querySelectorAll( ".gplus" )
      for i in [ 0..._dom.length ]
        _dom[ i ].style.opacity = 1

      po = document.createElement "script"
      po.type = "text/javascript"
      po.async = true
      po.src = "https://apis.google.com/js/plusone.js"
      s = document.getElementsByTagName( "script" )[0]
      s.parentNode.insertBefore po, s

    # fb-share
    if _type.fb_share?
      if !_type.fb?
        fjs = document.getElementsByTagName( "script" )[ 0 ]
        return if document.getElementById "facebook-jssdk"
        js = document.createElement "script"
        js.id = "facebook-jssdk"
        js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&" +
                "appId=1548831858693621&version=v2.0"
        fjs.parentNode.insertBefore js, fjs

    ###
    # fb-share
    $( document ).on "click", ".fb-share button", ( e )->
      window.FB.ui
        method: "share"
        href: window.location.href
    ###

    # tweet
    $( document ).on "click", ".tweet a", ( e )->
      e.preventDefault()

      if window.screenLeft?
        _dualScreenLeft = window.screenLeft
        _dualScreenTop = window.screenTop
      else
        _dualScreenLeft = screen.left
        _dualScreenTop = screen.top

      if window.innerWidth?
        _windowWidth = window.innerWidth
        _windowHeight = window.innerHeight
      else if document.documentElement?.clientWidth?
        _windowWidth = document.documentElement.clientWidth
        _windowWidth = document.documentElement.clientHeight
      else
        _windowWidth = screen.width
        _windowWidth = screen.height

      _popupWidth = 650
      _popupHeight = 450

      _left = ( ( _windowWidth / 2 ) - ( _popupWidth / 2 ) ) + _dualScreenLeft
      _top = ( ( _windowHeight / 2 ) - ( _popupHeight / 2 ) ) + _dualScreenTop

      window.open $( e.currentTarget ).attr( "href" ), "twitter",
                  "width=#{ _popupWidth }, height=#{ _popupHeight }, " +
                  "top=#{ _top }, left=#{ _left }"

  callback: ->
    # twitter
    window.twttr.ready ( twttr )->
      twttr.events.bind "tweet", ->
        _callback "tw"

    # facebook like
    window.onload = ->
      window.FB.Event.subscribe "edge.create",
        ( response )->
          _callback "fb" if response

    _callback = ( type )->
      console.log type

getInstance = ->
  if !instance
    instance = new Social()
  return instance

module.exports = getInstance
