# Load Vendor Scripts
require("./vendor/prism.js")

# Load Local Scripts
$(document).ready () ->
    require("./scripts/hamburger")
    require("./scripts/scroll")
    require("./scripts/social")

$(window).load () ->
    $("#spinner").fadeOut 1000, ->
        $("#splashscreen").fadeOut 500
