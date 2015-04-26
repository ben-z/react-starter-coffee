if typeof define != 'function'
  define = require('amdefine')(module)

define (require) ->

  React = require 'react'
  TopBar = require '../shared/topbar'

  Welcome = React.createClass(
    _handleClick: ->
      alert 'hi'
    render: ->
      <div>
        <h1 onClick={this._handleClick}>Hello</h1>
        <TopBar />
      </div>
  )

  return Welcome
