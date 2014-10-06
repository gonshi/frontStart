( function( global, doc, $, ns ) {
  'use strict';
  ns = ns || {};  

  function Throttle( minInterval ){
    this.interval = minInterval;
    this.prevTime = 0;
    this.timer = function(){};
  }

  Throttle.prototype.exec = function( callback ){
    var now = + new Date(),
        delta = now - this.prevTime;

    clearTimeout( this.timer );
    if( delta >= this.interval ){
      this.prevTime = now;
      callback();
    }
    else{
      this.timer = setTimeout( callback, this.interval );
    }
  };

  ns.Throttle = Throttle;
  global.namespace = ns;
})( this, document, jQuery, this.namespace );
