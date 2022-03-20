module.exports = ((error ,req ,res , next) => {
    res.status(500).send("error From Middleware/error.js\n" + error.message)
})
