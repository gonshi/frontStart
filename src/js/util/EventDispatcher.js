(function( global, doc, $, ns, undefined ) {
  'use strict';
  ns = ns || {};  

  function EventDispatcher() {
    this._events = {};
  }

  EventDispatcher.prototype.hasEventListener = function( eventName ) {
    return !!this._events[ eventName ];
  };

  EventDispatcher.prototype.addEventListener = function( eventName, callback ) {
    if ( this.hasEventListener(eventName) ) {
      var events = this._events[ eventName ];
      var i;
      var eventsLength;
      for ( i = 0; i < eventsLength; i++ ) {
        if ( events[ i ] === callback ) {
          return;
        }
      }
      events.push( callback );
    }
    else{
      this._events[ eventName ] = [ callback ];
    }
    return this;
  };

  EventDispatcher.prototype.removeEventListener = function( eventName, callback ) {
    if ( !this.hasEventListener(eventName) ) {
      return;
    }
    else{
      var events = this._events[ eventName ],
          i      = events.length,
          index;
      while ( i-- ) {
        if ( events[ i ] === callback ) {
          index = i;
        }
      }
      events.splice( index, 1 );
    }
    return this;
  };

  EventDispatcher.prototype.fireEvent = function( eventName, opt_this ) {
    if ( !this.hasEventListener(eventName) ) {
      return;
    }
    else{
      var events = this._events[ eventName ];
      var i;
      var copyEvents = $.merge( [], events );
      var copyEventsLength = copyEvents.length;
      var arg        = $.merge( [], arguments );
      arg.splice( 0, 2 );
      for ( i = 0; i < copyEventsLength; i++ ) {
        copyEvents[ i ].apply( opt_this || this, arg );
      }
    }
  };

  ns.EventDispatcher = EventDispatcher;
  global.namespace = ns;
})( this, document, jQuery, this.namespace );
