  WebRequest := Object clone do(
    Regex
    httpRequestLineRE := "^([A-Z]+) ([^ ]+) (.*)$"
    handleSocket := method(aSocket,
      aSocket streamReadNextChunk
      v := aSocket readUntilSeq("\n")
      v println
      line := v findRegex(httpRequestLineRE)
      aSocket write(map at(line at(2)) GET)
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
    GET := "Andrew"
  )
  
  map := Map clone
  map atPut("/name/", name)

  WebServer start