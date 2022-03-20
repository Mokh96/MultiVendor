const router = require('express').Router();
const {params, objectModel} = require('../middleware')

router.use(objectModel)

router.get('/:id?', params, async (req, res) => {
    let result;
    const id = req.params.id
    if (id)
        result = await req.objectModel.findUnique({where: {id: parseInt(id)}})
    else
        result = await req.objectModel.findMany()
        

    res.status(200).send(result)
})

router.post('/',  async (req, res) => {
    const Model = await req.objectModel.createMany({data: req.body })
    res.status(201).send(Model)
})

router.delete('/:id', async(req , res)=>{

    const ob = req.objectModel
    const object = await ob.delete({
        where: { id : parseInt(req.params.id)  }
    })

    res.status(200).send(object)
})

router.put('/:id',objectModel , async(req , res)=>{
    const object = await req.objectModel.update({
        where:{id : parseInt(req.params.id)},
        data: req.body
    })

    res.status(200).send(object)
})

module.exports = router