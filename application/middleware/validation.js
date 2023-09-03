const db = require('../conf/database');
const validator = require("validator");
module.exports ={
    checkUsername: function(req,res,next){
        var { username } = req.body;
        if(validator.isAlpha(username.charAt(0))
            && validator.isLength(username,{min:3})){
                next();
        } else {
            req.flash("error","Invalid Username");
            return res.redirect("/registration")
        }
    },
    checkEmail: function(req,res,next){
        var { email } = req.body;
        if(validator.isEmail(email)){
            next();
        } else {
            req.flash("error","Invalid Email");
            return res.redirect("/registration")
        }
    },
    checkPassword: function(req,res,next){
        var {password, confirmPassword} = req.body;
        if (validator.isStrongPassword(password)
            && password == confirmPassword) {
                next();
        } else{
            res.locals.perrors = "invalid password";
            req.flash("error","Invalid Password or Re-enter Password");
            return res.redirect("/registration")
        }
    },
    checkUsernameExist: async function(req,res,next){
        var {username} = req.body;
        var [results, _] = await db.execute(`select id from users 
                              where username=?`,[username]
        );
        if(results && results.length>0){
            req.flash("error", "Username already exists!");
            req.session.save(function(err){
                if (err) next(err);
                return res.redirect("/registration");
            })
        } else{
            next();
        }
    },
    checkEmailExist: async function(req,res,next){
        var {email} = req.body;
        var [results, _] = await db.execute(`select id from users 
                              where email=?`,[email]
    );
        if(results && results.length>0){
            req.flash("error", "Email already exists!");
            req.session.save(function(err){
                if (err) next(err);
                    return res.redirect("/registration");
            })
        } else{
            next();
        }
    },
}