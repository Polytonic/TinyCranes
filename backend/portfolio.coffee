parse = require("./shared").parse
files = ["hunt-and-peck",
        "flows",
         "yesterday",
         "winter",
         "sticks-and-stones",
         "trajectory",
         "fidelis",
         "midnight",
         "overburdened",
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
