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
    content.body = md(content.body)
    content.slug = filename
    return content
