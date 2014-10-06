( function( global, doc, $, ns ) {
  'use strict';
  ns = ns || {};

  ns.wait = function( waitTime, callback ){
    var args = arguments;
    Array.prototype.splice.call( args, 0, 2 );

    setTimeout( function(){
      callback.apply( this, args );
    }, waitTime );
  };

  global.namespace = ns;
})( this, document, jQuery, this.namespace ); 
