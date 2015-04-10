parse = require("./shared").parse
files = ["flows",
         "hunt-and-peck",
         "winter",
         "sticks-and-stones",
         "overburdened",
         "trajectory",
         "fidelis",
         "midnight",
         "yesterday",
         "goliath",
         "footsteps",
         "apostrophe",
         "vertigo",
         "rotary",
         "monotony",
         "lost-manuscript",
         "mockingbird"]

items = (parse("content/portfolio", i) for i in files)

module.exports = (app) ->

    app.use "/portfolio/", require("express").static("content/portfolio/")
    app.get "/portfolio/", (req, res) -> res.render("portfolio", items: items)
