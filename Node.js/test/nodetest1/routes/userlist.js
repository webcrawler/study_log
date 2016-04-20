var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(db) {
    return function(req, res) {
    	res.send('hello mongod !');
        var collection = db.get('usercollection');
        collection.find({},{},function(e,docs){
            res.render('userlist', {
                "userlist" : docs
            });
        });
    };
});

// router.get('/', function(req, res, next) {
//   res.send('hello mongod !');
// });

module.exports = router;

