window.scrollReveal = new scrollReveal
  reset: true
  viewportFactor: 0.01

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

$ ->
  $("a[href*=#]:not([href=#])").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 750
        false

$(".carousel").slick
  infinite: true
  slidesToShow: 1
  dots: true
  arrows: false
  autoplay: true
  autoplaySpeed: 10000
  lazyLoad: "ondemand"

$("#yesterday").hover toggleControls = ->
  if @hasAttribute("controls")
    @removeAttribute "controls"
  else
    @setAttribute "controls", "controls"
  return
