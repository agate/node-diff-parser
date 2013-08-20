Diff Parser

Installation
=====

via npm:

```bash
$ npm install diff-parser # use -g if you want to use diff2html
```

Usage
=====

CLI
---

```
git diff [file|dir] > filename.diff
diff2html path/to/filename.diff > filename.html
```

Node
----

```javascript
var diffParser = require("diff-parser");
var diffFiles = diffParser.parse(diffString);
console.log(diffFiles); // here have all info you need.
```