glob = require("glob")
moment = require("moment")
parse = require("./shared").parse
slugify = (text) ->
    return text.toString().toLowerCase()
        .replace(/\s+/g, "-")       # Swap Spaces With `-`
        .replace(/[^\w\-]+/g, "")   # Strip Non-Word Chars
        .replace(/\-\-+/g, "-")     # Condense Multiple `-`
        .trim()                     # Trim Whitespace


files = glob.sync("**/**/*.md", cwd: "content/posts")
files = (i.replace(".md", "") for i in files)
files = (parse("content/posts", i) for i in files)

for i in files
    i.attributes.datetime = new Date(i.attributes.datetime)
    i.moment = moment(i.attributes.datetime)
    i.slug = slugify(i.attributes.title) for i in files

files.sort (a, b) -> return b.attributes.datetime - a.attributes.datetime

posts = {}
posts[i.moment.format("YYYY")] = [] for i in files
for i in files
    if i.moment.format("YYYY") of posts
        posts[i.moment.format("YYYY")].push(i)

module.exports = (app) ->

    app.use "/uploads", require("express").static("content/uploads/")

    app.get "/blog/", (req, res) ->
        res.render("entry", entries: posts[files[0].moment.format("YYYY")])


    app.get "/blog/archive/", (req, res) ->

        years = []
        for i in files
            year = i.moment.format("YYYY")
            years.push(year) if year not in years

        entries = {}
        entries[i.moment.format("YYYY")] = [] for i in files
        for i in files
            if i.moment.format("YYYY") of entries
                if i.moment.format("MMMM") not in entries[i.moment.format("YYYY")]
                    entries[i.moment.format("YYYY")].push(i.moment.format("MMMM"))

        months =
            January:   "01"
            February:  "02"
            March:     "03"
            April:     "04"
            May:       "05"
            June:      "06"
            July:      "07"
            August:    "08"
            September: "09"
            October:   "10"
            November:  "11"
            December:  "12"

        res.render("archive",
                    years: years
                    months: months
                    entries: entries)

    app.get "/blog/latest/", (req, res) ->

        yyyy = files[0].moment.format("YYYY")
        mm = files[0].moment.format("MM")
        res.redirect("/blog/#{yyyy}/#{mm}/#{files[0].slug}/")


    app.get "/blog/:year/", (req, res) ->
        if req.params.year of posts
            entries = []
            for post in posts[req.params.year]
                entries.push(post)
            return res.render("entry", entries: entries)

    app.get "/blog/:year/:month/", (req, res) ->
        if req.params.year of posts
            entries = []
            for post in posts[req.params.year]
                if req.params.month == post.moment.format("MM")
                    entries.push(post)
            return res.render("entry", entries: entries)

    app.get "/blog/:year/:month/:slug/", (req, res) ->

        if req.params.year of posts
            for post in posts[req.params.year]
                if req.params.month == post.moment.format("MM")
                    if req.params.slug == post.slug
                        return res.render("entry",
                                          entries: [post]
                                          single_post: true)


module.exports.posts = posts
module.exports.files = files
