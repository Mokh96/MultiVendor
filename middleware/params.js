
module.exports = ((req, res, next) => {
    const offset = parseInt(req.query.offset) || 0
    const limit = parseInt(req.query.limit) || 25

    //const CatStore = IsEmpty(parseInt(req.query.CatStore))
    let CatStore ; if(req.query.cat_store) CatStore = parseInt(req.query.cat_store) 

    let Brand ; if(req.query.brand) Brand = parseInt(req.query.brand);

    let Promo ; if(req.query.promo) Promo = parseInt(req.query.promo)

    let PriceMin; if (req.query.price_min) PriceMin = parseInt(req.query.price_min)

    let PriceMax ; if(req.query.price_max) PriceMax = parseInt(req.query.price_max)

    let Category; if(req.query.p_category) Category = parseInt(req.query.p_category)

    const orders = ['desc','asc']
    const orderBy = []

    let order ; // = 'desc';
    if(req.query.order &&  orders.includes(req.query.order)){
        order = req.query.order
        orderBy.push({id : req.query.order})  
    }

    if(req.query.order_price &&  orders.includes(req.query.order_price) ){
        orderBy.push({price : req.query.order_price}) 
    }

    if(req.query.order_name &&  orders.includes(req.query.order_name)){
        orderBy.push({name : req.query.order_name}) 
    }

    req.mParams = {offset, limit, order ,CatStore,Brand,Promo,PriceMin,PriceMax,Category,orderBy}
    next()
})


