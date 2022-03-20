const router = require('express').Router();
const {params} = require('../middleware')
const bcrypt = require('bcrypt');
const {PrismaClient} = require('@prisma/client');
const {user} = new PrismaClient()
const crypto = require("crypto");

async function exclude(user, ...keys) {
    for (let key of keys) {
      delete user[key]
    }
    return user
}

  async function excludeAll(user, password) {
    user.forEach(element => {
        delete element[password]
    });
    return user
  }
router.post('/',async(req , res)=>{    
    const salt = await bcrypt.genSalt(10)
    req.body.password = await bcrypt.hash(req.body.password , salt)

    req.body.aff_code = await crypto.randomBytes(10).toString('hex') + Date.now("ddMMyyhhmm").toString();

    const result = await user.create({data: req.body })

    res.status(201).send(result)
})

router.get('/:id?', params, async(req , res)=>{
    const id = req.params.id
    let userWithoutPassword;
    let result;
    if (id){
        result = await user.findUnique(
            {where: {id: parseInt(id)},
        include:{
            user_userTouser_aff_by : true,
            user_userTouser_modifed_by : true,
            brand : true
        }
    })
        userWithoutPassword = await exclude(result, 'password')
    }
        
    else{
        result = await user.findMany({
            where :{ id : req.params.id},

            skip: req.mParams.offset,
            take: req.mParams.limit,
            
            orderBy: {
                id: req.mParams.order,
            },
            include:{
                user_aff_by : true,
                wishlist : true,
                vendor : true,
                response_user : true,
                response_admin :true,
            },
        })

        userWithoutPassword = await excludeAll(result, 'password')
    }

    res.status(200).send(userWithoutPassword)
})

router.put('/:id?', params ,async(req ,res)=>{
    result = await user.update(
        {
            where:{id : parseInt(req.params.id)},
            data: req.body
        })
    res.status.send(result)
})


module.exports = router