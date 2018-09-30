const fs = require('fs');
const util = require('./utils');

module.exports = {
  handleRequest: function(response) {
    response.statusCode = 200;
    response.write(`
    <html>
    <head>
    <script>${fs.readdirSync("../Web/build.js")}</script>
    <style>${fs.readFileSync("../Web/style.css")}</style>
    </head>
    ${fs.readFileSync("../Web/body.html")}
    </html>
    `);
  },
}