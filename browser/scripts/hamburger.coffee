container = $(".hamburger-container")
menu = $(".hamburger-links")

# should add keybinds/touch-gestures (hammerjs?)
#open or close the menu clicking on the bottom "menu" link
$(".hamburger-button").on "click", () ->
    $(@).toggleClass("expanded")
    menu.off("transitionend")
        .toggleClass("visible")

$(window).scroll -> checkMenu()
$(window).resize -> checkMenu()

checkMenu = () ->

    # Compute the Offset
    offset = ($(".navbar").height() * 1.25) or window.innerHeight
    console.log offset
    if $(window).scrollTop() > offset and not container.hasClass("fixed")
        container.addClass("fixed").find(".hamburger-button").one "animationend", ->
            menu.addClass("has-transitions")

    else if $(window).scrollTop() <= offset
        #check if the menu is open when scrolling up
        if menu.hasClass("visible")
            #close the menu with animation
            menu.addClass("collapsed").one "transitionend", ->
                #wait for the menu to be closed and do the rest
                menu.removeClass("visible collapsed has-transitions")
                container.removeClass("fixed")
                $(".hamburger-button").removeClass("expanded")

        #scrolling up with menu closed
        else
            container.removeClass("fixed")
            menu.removeClass("has-transitions")
