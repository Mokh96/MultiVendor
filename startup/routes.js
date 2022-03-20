const error = require("../middleware/error")


module.exports =  (app)=> {
    app.use("/api/v1/auth", require('../routes/auth'))
    app.use(require('../middleware/auth'))

    app.use("/api/v1/common", require('../routes/common'))
    app.use("/api/v1/users", require('../routes/users'))
    app.use("/api/v1/products", require('../routes/product'))
    app.use(error)
}