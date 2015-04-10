# Enable New Relic
if process.env.NODE_ENV == production
    newrelic = require("newrelic")
    console.log newrelic

# Setup Application Middleware
app = () ->

    # Configure Express
    @locals.newrelic = newrelic
    @enable "strict routing"
    @use do require("express-slash")
    @use do require("compression")
    @set("views", "browser/partials")
    @set("view engine", "jade")

    # Define Static Paths
    bower  = "#{__dirname}/../bower_components/"
    client = "#{__dirname}/../browser/"

    # Setup Application Asset Pipeline
    browserify = require("browserify-middleware")
    @use "/index.js", browserify "#{client}/index.coffee",
        extensions: [".coffee"]
        transform: require("coffeeify")
    @use           require("harp")    .mount client
    @use "/bower", require("express") .static bower

    # Application Routing Table
    require("./entry")(@)
    require("./portfolio")(@)

# Export the Application Object
app = app.call do require("express")
app.listen(process.env.PORT or 8080)
