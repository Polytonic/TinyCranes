$(".twitter").click (event) ->

    # console.log window.location.href
    # console.log [location.protocol, "//", location.host, location.pathname].join("");

    url = "#{@href}?via=tinycranes&text=#{document.title}"
    options = []
    params =
        width: 550
        height: 420
    params.left = ($(window).width()  - params.width) / 2
    params.top  = ($(window).height() - params.height) / 2

    options.push("#{key}=#{val}") for key, val of params
    window.open url, "Twitter", options.join(",")
    return false if $(window).width() > 568
