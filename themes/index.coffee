window.scrollReveal = new scrollReveal
  reset: true

showNextQuote = ->
  ++quoteIndex
  quotes.eq(quoteIndex % quotes.length)
    .fadeIn  1000
    .delay   8500
    .fadeOut 500
    ,showNextQuote

quotes = $(".cycle")
quoteIndex = -1
showNextQuote()
