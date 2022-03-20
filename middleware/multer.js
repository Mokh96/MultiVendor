const multer = require('multer')
const path = require('path');
let md5 = require("md5")
const {nanoid} = require('nanoid')//generate random name

const fileStorageEngine = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './upload/images')
    },
    filename: function (req, file, cb) {//generate the fileName
        let ext = path.extname(file.originalname);
        cb(null, md5(Date.now() + '-' + nanoid(15)) + ext)
    }
})

const uploadSingle = multer(
    {
        storage: fileStorageEngine,
        fileFilter: function (req, file, callback) {
            let ext = path.extname(file.originalname);
            if (ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {// change to Array
                return callback(new Error('Only images are allowed .'))
            }
            callback(null, true)
        },
        limits: {
            fileSize: 1024 * 1024
        }
    }
).single('image')

module.exports = uploadSingle