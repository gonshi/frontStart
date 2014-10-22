( function( global, doc, $, ns ) {
  'use strict';
  ns = ns || {};  

  function EventDispatcher() {
    this._events = {};
  }

  EventDispatcher.prototype.checkEvent = function( eventName ) {
    return !!this._events[ eventName ];
  };

  EventDispatcher.prototype.listen = function( eventName, callback ) {
    if ( this.checkEvent(eventName) ) {
      var events = this._events[ eventName ];
      var i;
      var eventsLength = events.length;
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

  EventDispatcher.prototype.removeEvent = function( eventName, callback ) {
    if ( !this.checkEvent(eventName) ) {
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

  EventDispatcher.prototype.fire = function( eventName, opt_this ) {
    if ( !this.checkEvent(eventName) ) {
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
