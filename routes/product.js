const router = require('express').Router();
const {params} = require('../middleware')
const {PrismaClient} = require('@prisma/client');
const {product} = new PrismaClient()

const include = { 
    user_created_by : { select :{
            username : true,
            last_name : true,
            first_name : true,
            email : true,
            adresse : true,
        }},
    brand : true,
    product_category_01 : true,
    product_category_02 : true,
    product_category_03 : true,
    store_category : true,
    user_modified_by : { select :{
        username : true,
        last_name : true,
        first_name : true,
        email : true,
        adresse : true,
    }},
    discount : true,
    product_gallery : true,
    //order_item : true,
    //wishlist : true,
}

router.post('/',async(req , res)=>{
    const Model = await product.createMany({data: req.body })
    res.status(201).send(Model)
})

router.get('/filter/:id?', params, async(req , res)=>{   
    
    let id ;
    if(req.params.id) id =parseInt(req.params.id);

    let where = { 
        id,
        id_cat_store : req.mParams.CatStore,
        id_brand : req.mParams.Brand,
        price : {
            gte : req.mParams.PriceMin,
            lte : req.mParams.PriceMax,
        }
    }

    if(req.mParams.Promo) where.promo = {gt : 0 }
    
    if (req.mParams.Category)
        where.OR =  [
            { id_cat1 : req.mParams.Category },
            { id_cat2 : req.mParams.Category },
            {
                id_cat3 : req.mParams.Category
            },
        ]
        
    result = await product.findMany({
        where,
        orderBy : req.mParams.orderBy ,
        skip: req.mParams.offset,
        take: req.mParams.limit,

        include
    })
    res.status(200).send(result)
})

router.get('/:id?', params, async(req , res)=>{
    const id = req.params.id;
    if (id){
        result = await product.findUnique({
            where: {id: parseInt(id)},
            include
        })
    }
    else{
        result = await product.findMany({
            skip: req.mParams.offset,
            take: req.mParams.limit,
            orderBy: {
                id: req.mParams.order,
            },
            include
        })
    }
    res.status(200).send(result)
})

router.put('/:id?', params ,async(req ,res)=>{
    result = await product.update(
        {
            where:{id : parseInt(req.params.id)},
            data: req.body
        })
    res.status.send(result)
})

module.exports = router