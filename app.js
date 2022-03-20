const express = require("express")
const app = express()
const cors = require('cors');
app.use(cors())

require("express-async-errors")

app.use(express.urlencoded({extended: false}))
app.use(express.json())


require("./startup/routes")(app);
require("./routes/prod")(app);


app.use((req, res) => {
    res.status(404).send("404 not Found.")
})

const port = process.env.PORT || 5000
app.listen(port ,()=> console.log(`Listening on Port ${port} ...`))