WebRequest := Object clone do(
  Regex
  httpRequestLineRE := "^([A-Z]+) ([^ ]+) (.*)$"

  getResponseObject := method(handler_map, path,
    handler_map foreach (v,
      if(path matchesOfRegex(v at(0)) at(0), return v at(1)))
  )

  handleSocket := method(aSocket, handler_map,
    aSocket streamReadNextChunk
    v := aSocket readUntilSeq("\n")
    line := v findRegex(httpRequestLineRE)
    responseObject := getResponseObject(handler_map,line at(2))
    aSocket write(responseObject perform(line at(1)) respond)
    aSocket close
  )
)

Framework := Server clone do(
  handleSocket := method(aSocket,
    WebRequest clone @handleSocket(aSocket, handlers)
  )

  with := method(handler_map, port,
    self setPort(port)
    self handlers := handler_map
    self
  )
)
