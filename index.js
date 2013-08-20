require('coffee-script');

var fs = require('fs');
var jade = require('jade');
var parser = require('./lib/diff_parser');

var diffFile = process.argv[2];
var diffStr = fs.readFileSync(diffFile).toString();
var parsedFiles = parser.parse(diffStr);

var html = jade.renderFile('./templates/simple.jade', {
  parsedFiles: parsedFiles
});

console.log(html);
