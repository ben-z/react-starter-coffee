var router = require('express').Router();

router.get('/', function(req, res){
  // console.log("Cookies: ", req.cookies)
  res.send(req.renderHTML('Welcome', 'app/welcome',{name: 'Bob the Unicorn'}));
});

module.exports = router;
