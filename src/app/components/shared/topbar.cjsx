if typeof define != 'function'
  define = require('amdefine')(module)

define (require) ->

  React = require 'react'

  TopBar = React.createClass(
    _handleClick: ->
      alert 'hiii'
    render: ->
      <h1 onClick={this._handleClick}>HIIII</h1>
  )

  return TopBar
