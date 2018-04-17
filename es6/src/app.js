const express = require('express')

const app = express()

app.use('/', (req, res)=> {
  let _obj = { a: 1, b: 2 }
  let { a } = _obj
  res.send(`a --- is ${a}`)
})

app.listen(3000)
