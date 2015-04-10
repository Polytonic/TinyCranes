# Begin Instrumentation
newrelic = require("newrelic") if process.env.NODE_ENV == "production"
app = do require("express")
app.locals.newrelic = newrelic
configure = () ->

    console.log @locals.newrelic

    # Configure Express
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
    return @

# Start the Express Server
configure.call(app).listen(process.env.PORT or 8080)
