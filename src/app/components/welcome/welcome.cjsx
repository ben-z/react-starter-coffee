# Node does not have a define function, so we use amdefine
if typeof define != 'function'
  define = require('amdefine')(module)

# RequireJS implementation, works on Node as well as in the browser
define (require) ->

  React = require 'react'
  TopBar = require '../shared/topbar'

  Welcome = React.createClass(
    render: ->
      <div>
        <TopBar />
        <h1>Hello, world.</h1>
        <p>This is a React starter template written in coffeescript.</p>
        <p><small><a href="https://facebook.github.io/react/">Isomorphic</a> · <a href="http://coffeescript.org/">CoffeeScript</a> · <a href="http://gulpjs.com/">Gulp Builds</a> · <a href="https://github.com/ben-z/React-Express-Starter-Template">Beginner Friendly</a></small></p>
        <p>Hey, I have a <a href="https://benzhang.xyz/">blog</a>!</p>
        <p><i className="fa fa-star"></i> Star this project on <a href="https://github.com/ben-z/React-Express-Starter-Template"> Github</a></p>
      </div>
  )

  return Welcome
