if typeof define != 'function'
  define = require('amdefine')(module)

define (require) ->

  React = require 'react'
  TopBar = require '../shared/topbar'

  Welcome = React.createClass(
    render: ->
      <div>
        <TopBar />
        <h1>Hello</h1>
        <p>Hope you will find this template useful.</p>
        <p>Hey, I have a <a href="http://benzhang.xyz/">blog</a>!</p>
        <p><i className="fa fa-star"></i> Star this project on <a href="https://github.com/ben-z/React-Express-Starter-Template"> Github</a></p>
      </div>
  )

  return Welcome
