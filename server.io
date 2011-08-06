  WebRequest := Object clone do(
    handleSocket := method(aSocket,
      aSocket streamReadNextChunk
      request := aSocket readBuffer betweenSeq("GET ", " HTTP")
      aSocket write(map at(request) GET)
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