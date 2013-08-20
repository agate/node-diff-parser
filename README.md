# ![Diff Parser for Node](https://raw.github.com/agate/node-diff-parser/master/logo.svg)

## Installation

via npm:

```bash
$ npm install diff-parser # use -g if you want to use diff2html
```

## Usage

### Command Line

```bash
$ git diff [file|dir] > filename.diff
$ diff2html path/to/filename.diff > filename.html
```

### Node

```javascript
var diffParser = require("diff-parser");
var diffFiles = diffParser.parse(diffString);
console.log(diffFiles); // here have all info you need.
```

## TODO

* Right now it only support git diff. So the next improvement should be
  support more type of diffs.
* Let user customize their styles for the diff html page.

## License

MIT
