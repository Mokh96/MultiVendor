const router = require('express').Router();
const bcrypt = require('bcrypt');
const {PrismaClient} = require('@prisma/client');
const jwt = require("jsonwebtoken");

const {user} = new PrismaClient()

router.post('/',async (req , res)=>{
        const result = await user.findFirst({
                where : {
                        OR:[    {email : req.body.email},
                                {username : req.body.username}
                        ]
                },
        })
//         const user = await User.findOne({email : req.body.email})
         if(!result) return res.status(400).send('email or username are false')

        const valid = await bcrypt.compare(req.body.password , result.password )
        if(!valid) return res.status(400).send('password is wrong'); 

         const token = await generateAuthToken(result)
        res.send(token)
})

async function generateAuthToken (user){
        return  jwt.sign({
            id : user.id ,
            email : user.email,
            password : user.password,
        },process.env.PrivateKey)
    }

module.exports = router