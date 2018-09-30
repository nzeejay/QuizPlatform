const fs = require('fs');

require("http").createServer((request, response) => {
  response.statusCode = 200;
  response.write(`
    <html>
    <head>
      <script>${fs.readFileSync("./Web/build.js")}</script>
      <style>${fs.readFileSync("./Web/style.css")}</style>
    </head>
    <body>

    </body>
    </html>
  `);
}).listen(80);