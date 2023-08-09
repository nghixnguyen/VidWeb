var express = require("express");
var router = express.Router();
var bcrypt = require("bcrypt");
const db = require('../conf/database');
const validator = require("validator");
const { checkUsernameExist, checkEmailExist, checkUsername, checkEmail, checkPassword } = require("../middleware/validation");
// const { use } = require(".");

/* GET users listing. */
router.post("/registration", 
  checkUsername, 
  checkEmail, 
  checkPassword,
  checkUsernameExist, 
  checkEmailExist, 
  async function(req, res, next) {
    var {username, email, password, confirmPassword} = req.body;
    // res.locals.formdata = {
    //   email,password,username
    // }

    // if(!validator.isAlpha(username.charAt(0))){
    //   req.flash("error", "Username must be 3 or more characters");

    //   // return res.send("Invalid First Letter of Username")
    // }
    // if(validator.isLength(username,{max:2})){
    //   req.flash("error","Invalid Length of Username")
    // }
    // if(validator.isLength(password,{max:7})){
    //   req.flash("error","Invalid Length of Password")
    // }
    // if (!validator.isStrongPassword(password)) {
    //   req.flash("error","Password must contain at least one uppercase letter");
    // }
    // if (!validator.matches(password, /[0-9]/)) {
    //   req.flash("error","Password must contain at least one number");
    // }
    // if (!validator.matches(password, /[/*\-+!\[\]@#$^&~]/)) {
    //   req.flash("error","Password must contain at least one special character");
    // }

    // if (password !== confirmPassword) {
    //   req.flash("error","Password must match");
    // }
    try{
    
      var hashedPassword = await bcrypt.hash(password, 5);

      var[insertResult, _] = await db.execute(`INSERT INTO users (username,
              email, password) VALUE (?,?,?);`,[username, email, hashedPassword]
      );

      if(insertResult && insertResult.affectedRows == 1){
        return res.redirect("/login");
      }else{
        return res.redirect("/registration");
      }

    }catch(err){
      next(err);
    }
  });

router.post("/login", async function(req, res, next) {
  var {username, password} = req.body;
  try{
    var [results, _] = await db.execute(`select id, username, 
        email, password from users where username=?`,[username]
    );

    const user = results[0];
    if(!user){
      req.flash("error", "Login Failed: Invalid Credentials")
      return req.session.save(function(err){
        return res.redirect("/login");
      })
    }

    var passwordsMatch = await bcrypt.compare(password, user.password);

    if(passwordsMatch){
      req.session.user = {
        userId: user.id,
        username: user.username,
        email: user.email
      }
      req.flash("success", "You are logged in")
      return req.session.save(function(err){
        return res.redirect("/");
      })

    }else{
      req.flash("error", "Login Failed: Incorect username or password")
      return req.session.save(function(err){
        return res.redirect("/login");
      })    
    }

  }catch(err){
    next(err);
  }
});

router.post("/logout", function(req, res, next){
  req.session.destroy(function(err){
    if (err) next(err);
    return res.redirect("/");
  });
});


module.exports = router;
