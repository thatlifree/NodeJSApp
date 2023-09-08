'use strict';

const request = require("request");
const express = require('express');

// Constants
const PORT = process.env.PORT || 8080;
const HOST = process.env.HOST || 'localhost';

// App
const app = express();

app.get('/', (req, res) => {
  return res.send(`Hello World! To be or not to be`);
});

app.listen(PORT);
console.log(`Running on port :${PORT}`);
