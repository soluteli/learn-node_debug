express = require 'express'

app = express()

app.use '/', (req, res) ->
  _obj = { a: 1, b: 2 }
  { a } = _obj
  console.log('use use')
  res.send "a --- is #{a}"

app.listen 3000