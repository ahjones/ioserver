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
      aSocket write(responseObject perform(line at(1)))
      aSocket close
    )
  )

  WebServer := Server clone do(
    setPort(8000)
    handleSocket := method(aSocket,
      WebRequest clone @handleSocket(aSocket, handlers)
    )
    with := method(handler_map,
      self handlers := handler_map
      self
    )
  )

  name := Object clone do (
    GET := "GET Andrew"
    POST := "POST Andrew"
  )

  job := Object clone do (
    GET := "Programmer"
  )
  
  map := list()
  map append(list("name", name))
  map append(list("job", job))

  WebServer with(map) start