var express = require('express');
var router = express.Router();

/* GET home page. */
router.get("/index", function(req, res, next) {
  res.render('index');
});

router.get("/login", function(req, res, next) {
  res.render('login', {title: "Login", css:["style.css"]});
});

router.get("/postvideo", function(req, res, next) {
  res.render('postvideo');
});

router.get("/registration", function(req, res, next) {
  res.render('registration', {title: "Registration", js:["validation.js"]});
});

router.get("/viewpost", function(req, res, next) {
  // router.get("/viewpost/:id(\\d+)", function(req, res, next) {
  res.render('viewpost');
});


module.exports = router;
