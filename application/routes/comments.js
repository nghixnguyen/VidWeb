var express = require("express");
var router = express.Router();
const db = require('../conf/database');
const { isLoggedInJSON } = require("../middleware/auth");

router.post("/create", isLoggedInJSON , async function(req,res,next){
    var { postId, commentText } = req.body;
    var { userId, username } = req.session.user;

    try{
        var [insertResult, _ ] = await db.execute(`INSERT INTO comments (text, fk_postId, fk_userId ) 
        VALUE (?,?,?)`, [commentText, postId, userId]);
        if(insertResult && insertResult.affectedRows == 1){
            return res.status(201).json({
                status: "success",
                statusCode: 1,
                commentText,
                username,
                commentId: insertResult.insertId
            })
        } else {
            return res.status(500).json({
                status: "failed",
                statusCode: -1,
                message: "Could not create comment, try again later!"
            })
        }

    } catch (error){
        next(error);
    }
});
module.exports = router;