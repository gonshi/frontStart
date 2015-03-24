window.shuffle = ( arr )->
  copy = []
  n = arr.length

  while ( n )
    i = Math.floor( Math.random() * n-- )
    copy.push arr.splice( i, 1 )[ 0 ]
  return copy
