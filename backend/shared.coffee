fs = require("fs")
fm = require("front-matter")
md = require("marked")

md.setOptions
    renderer: new md.Renderer
    breaks: true
    smartLists: true
    smartypants: true

exports.parse = (directory, filename) ->
    content = fs.readFileSync("#{directory}/#{filename}.md", "utf-8")
    content = fm(content)

    if content.body.length > 600
        content.preview = content.body.split("\n")[0]
    if not content.attributes.description
        content.attributes.description = content.body.substring(0, 200).trim()

    content.body = md(content.body)
    content.slug = filename
    return content
