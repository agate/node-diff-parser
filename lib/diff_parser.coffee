DiffFile = require('./diff_file')

module.exports.parse = (diffStr) ->
  files = []
  currentFile = null

  lines = diffStr.split("\n")
  lines.pop();
  lines.forEach (line) ->
    if line.match(/^diff/)
      currentFile = new DiffFile(line)
      files.push(currentFile)
    else
      unless currentFile.headerParsed
        currentFile.setIndex(line) if line.match(/^index/)
        currentFile.finishHeaderParse() if line.match(/^\+\+\+/)
      else
        if line.match(/^@@/)
          currentFile.appendLine
            content: line
            type: 'chunk'
        else if line.match(/^-/)
          currentFile.appendLine
            content: line
            type: 'deletion'
        else if line.match(/^\+/)
          currentFile.appendLine
            content: line
            type: 'addition'
        else
          currentFile.appendLine
            content: line
            type: 'normal'

  return files
