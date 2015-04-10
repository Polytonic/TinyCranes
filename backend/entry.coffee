module.exports = (app) ->

    # Application Routing Table
    # https://blog.safaribooksonline.com/2014/03/13/parameterized-routes-express-js/
    # ask the database for the file contents
    # console.log "App"
    app.get "/b/:id/", (req, res) ->
        require("fs").readFile "package.json", (err, data) ->
            res.send(req.params.id + data)

