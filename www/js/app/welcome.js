// When Node.js requires this file, define "define" :D
if (typeof define !== 'function') {
  var define = require('amdefine')(module);
}

define(function(require){
  var React = require('react');

  var WelcomePage = React.createClass({
    _handleClick: function(){
      console.log('clicked!');
    },
    render: function(){
      return (
        // element name, props, child
        React.createElement('div', null,
          React.createElement('h1', null, 'Hello, ' + this.props.name + '!')
        )
      )
    }
  });

  return WelcomePage;
});
