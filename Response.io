Response := Object clone do(
  with := method(body,
    self body := body
    self
  )
  
  status := "HTTP/1.1 500 Internal Server Error\n\n"
  body := "Something has gone wrong. Please email help@google.com"
  respond := method(self status .. self body)
)

OK := Response clone do(
  status := "HTTP/1.1 200 OK\n\n"
)

NotFound := Response clone do(
  status := "HTTP/1.1 404 Not Found\n\n"
)
