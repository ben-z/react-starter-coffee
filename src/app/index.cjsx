# Node does not have a define function, so we use amdefine
if typeof define != 'function'
  define = require('amdefine')(module)

# RequireJS implementation, works on Node as well as in the browser
define (require) ->

  React = require('react')

  # Index is a wrapper for all components of the website
  Index = React.createClass(
    # Specifying prop types
    propTypes:
      component: React.PropTypes.string.isRequired
      title: React.PropTypes.string
      data: React.PropTypes.object

    # Render the template and pass data to child
    render: ->
      # The component should always have the same name as the folder
      C = require './components/' + @props.component + '/' + @props.component
      # Get the title, use default if null
      t = @props.title or 'React Coffeescript Starter Template'
      # Get default props for child, use {} if null
      data = @props.data or {}
      # Pre-render content
      preRendered = React.renderToString(<C {...data} />)
      # Render script for the client
      s = '
      require.config({
          baseUrl: "/js/",
          paths:{
              "react": "https://cdnjs.cloudflare.com/ajax/libs/react/0.13.2/react",
          },
          waitSeconds: 7
      });

      require(["react","components/'+@props.component+'/'+@props.component+'"], function(React, page){
        React.render(
          React.createElement(page,'+safeStringify(data)+'),
          document.getElementById("content")
        );
      });';

      return (
        <html>
          <head>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>{t}</title>
            <link rel="stylesheet" href="css/main.css" />
          </head>
          <body>
            <div id="content" dangerouslySetInnerHTML={__html:preRendered} />
            <script data-main="index" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.17/require.js"></script>
            <script dangerouslySetInnerHTML={__html:s} />
          </body>
        </html>
      )
  )

  # A better JSON.stringify
  safeStringify = (obj) ->
    JSON.stringify(obj)
            .replace(/<\/script/g, '<\\/script')
            .replace(/<!--/g, '<\\!--');

  return Index
