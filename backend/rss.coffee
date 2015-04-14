RSS = require("rss")
entries = require("./entry")

options =
    title: "TinyCranes"
    description: "Software design and development. I build things. Let's chat!"
    feed_url: "https://www.tinycranes.com/feed.xml"
    site_url: "https://www.tinycranes.com"
    # image_url: "https://www.tinycranes.com/favicon.png"

feed = new RSS(options)
for i in entries.files
    item_options =
        title: i.attributes.title
        description: i.body
        url: "https://www.tinycranes.com/blog/#{i.moment.format("YYYY/MM")}/#{i.slug}/"
        date: i.attributes.datetime

    feed.item(item_options)

xml = feed.xml()
module.exports = (app) ->

    app.get "/rss.xml", (req, res) ->
        res.set("Content-Type", "text/xml");
        res.send(xml)
