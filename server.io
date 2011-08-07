  WebRequest := Object clone do(
    Regex
    httpRequestLineRE := "^([A-Z]+) ([^ ]+) (.*)$"
    handleSocket := method(aSocket,
      aSocket streamReadNextChunk
      v := aSocket readUntilSeq("\n")
      v println
      line := v findRegex(httpRequestLineRE)
      aSocket write(map at(line at(2)) perform(line at(1)))
      aSocket close
    )
  )

  WebServer := Server clone do(
    setPort(8000)
    handleSocket := method(aSocket,
      WebRequest clone @handleSocket(aSocket)
    )
  )

  name := Object clone do (
    GET := "GET Andrew"
    POST := "POST andrew"
  )
  
  map := Map clone
  map atPut("/name/", name)

  WebServer start