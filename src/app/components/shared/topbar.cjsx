# Node does not have a define function, so we use amdefine
if typeof define != 'function'
  define = require('amdefine')(module)

# RequireJS implementation, works on Node as well as in the browser
define (require) ->

  React = require 'react'

  TopBar = React.createClass(
    _handleClick: ->
      alert 'hiii'
    render: ->
      <div id="top-bar">
        <a href="#">Some Link</a>&nbsp;|&nbsp;
        <a href="#">Some Link</a>&nbsp;|&nbsp;
        <a href="#">Some Link</a>&nbsp;|&nbsp;
        <button onClick={@_handleClick}>A button</button>
      </div>
  )

  return TopBar
