var express = require('express');
const { isLoggedIn } = require('../middleware/auth');
const { getRecentPosts } = require('../middleware/posts');
var router = express.Router();

/* GET home page. */
router.get("/", getRecentPosts,function(req, res, next) {
  res.render('index', {title: "Home", css:["style.css"]});
});

router.get("/login", function(req, res, next) {
  res.render('login', {title: "Login", css:["style.css"]});
});

router.get("/registration", function(req, res, next) {
  // res.render('registration', {title: "Registration", js:["validation.js"]});
  res.render('registration');
});
  
router.get("/postvideo", isLoggedIn, function(req, res, next) {
  res.render('postvideo');
});

// router.get("/logout", function(req, res, next) {
//   res.render('logout');
// });

module.exports = router;
