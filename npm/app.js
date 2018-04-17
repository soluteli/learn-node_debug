const express = require("express");

const app = express();

app.use("/", (req, res) => {
  console.log(999);
  res.send('I am in Docker')
});

app.listen(8001, () => {
  console.log("app is listening 8001");
});
