module.exports = class DiffFile
  constructor: (firstLine) ->
    temp = firstLine.replace(/diff --git a/, 'b')
    temp = temp.slice(0, (temp.length - 1) / 2)
    @name = temp.replace(/^b\//, '')
    @lines = []

  setIndex: (indexLine) ->
    match = indexLine.match(/^index\s+([^. ]+)\.\.([^. ]+)/)
    @from = match[1]
    @to = match[2]

  finishHeaderParse: ->
    @headerParsed = true

  appendLine: (line) ->
    @lines.push(line)

    if line.type == 'chunk'
      match = line.content.match(/^@@\s+\-(\d+),\d+\s+\+(\d+),/)
      @deletionLineNum = match[1]
      @additionLineNum = match[2]

    else if line.type == 'normal'
      line.deletionLineNum = @deletionLineNum++
      line.additionLineNum = @additionLineNum++

    else if line.type == 'deletion'
      line.deletionLineNum = @deletionLineNum++

    else if line.type == 'addition'
      line.additionLineNum = @additionLineNum++
