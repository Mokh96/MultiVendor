const {PrismaClient} = require('@prisma/client');
const models = new PrismaClient();

module.exports = ((req, res, next) => {
    const {table_name: tableName} = req.query
    if (!(tableName && models[tableName]))
        return res.status(400).send('bad request , table name is null .')
        
    req.objectModel = models[tableName];
    next()
})