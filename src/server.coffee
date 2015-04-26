express = require 'express'
bodyParser = require 'body-parser'
env = do ->
  Habitat = require('habitat')
  # .env.yml is compiled into .env.json when building
  Habitat.load __dirname+'/.env.json'
  new Habitat
app = express()
port = env.get('SERVER_PORT')
index = require './app/index'
React = require 'react'

MongoClient = require('mongodb').MongoClient
mongo_url = env.get('MONGO_URL')

# The function to Initialize server
Initialize = (db) ->
  app.use bodyParser.json(extended: false)

  # serve static files
  app.use '/js', express.static(__dirname+'/'+env.get('JS_FOLDER'))
  app.use '/css', express.static(__dirname+'/'+env.get('CSS_FOLDER'))

  # Routes
  app.get '/', (req, res) ->
    rendered = React.renderToStaticMarkup(React.createElement(index, {component:'welcome'}))
    res.send(rendered)

  app.listen port, ->
    console.log 'Listening on http://localhost:' + port
    return
# -------------------

# Connect to database
if mongo_url != 'DISABLED'
  MongoClient.connect mongo_url, (err, db) ->
    return console.log err if err
    console.log("Connected to MongoDB at "+mongo_url);
    Initialize db
else
  console.log 'MongoDB is disabled in \'.env.yml\''
  Initialize(null)
# -------------------
