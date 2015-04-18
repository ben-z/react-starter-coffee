var express = require('express')
  , bodyParser = require('body-parser')
  // Environmental variables are stored in '.env'
  , env = (function(){
      var Habitat = require("habitat");
      Habitat.load('.env');
      return new Habitat();
    }())
  , app = express()
  , routes = require('./routes')
  , PUBLIC_DIR = './www'
  , port = env.get('SERVER_PORT');

app.use(bodyParser.json({extended:false}));

// Serve files from the public directory
app.use(express.static(PUBLIC_DIR));

// This injects functions into the req variable
// for the routes to call in the other files
app.use(function(req, res, next){

  // Safetly converts objects into stings
  req.safeStringify = function(obj) {
    return JSON.stringify(obj)
            .replace(/<\/script/g, '<\\/script')
            .replace(/<!--/g, '<\\!--');
  }

  // Renders HTML pages (server side rendering)
  req.renderHTML = function(title, path, props){

    title = title ? title+' - ':'';
    var e = require('./www/js/'+path);
    var React = require('react');
    var rendered = React.renderToString(React.createElement(e,props));

    return('\
      <!DOCTYPE html>\
      <html lang="en">\
        <head>\
          <meta name="viewport" content="width=device-width, initial-scale=1">\
          <title>'+title+'Full Stack Template</title>\
          <link rel="stylesheet" href="css/main.css">\
        </head>\
        <body>\
          <div id="content">'+rendered+'</div>\
          <script data-main="js/common" src="js/lib/require.js"></script>\
          <script>\
            require(["'+path+'"], function(page){\
              var React = require("react");\
              React.render(\
                React.createElement(page,'+req.safeStringify(props)+'),\
                document.getElementById("content")\
              );\
            });\
          </script>\
        </body>\
      </html>\
    ');
  }.bind(this);

  next();
});


// Connecting to MongoDB
var MongoClient = require('mongodb').MongoClient;
var url = env.get('MONGO_URL');

MongoClient.connect(url, function(err, db) {
  if(err) return console.log(err);
  console.log("Connected correctly to server at url: "+url);

  // Attach db object to request for routes to access
  app.use(function(req,res,next){
    req.db = db;
    next();
  });

  // Routes are now in ./routes folder
  app.use('/', routes);

  app.listen(port, function(){
    console.log('Listening on ' + port);
  });
});
