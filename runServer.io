name := Object clone do (
  Response
  GET := method(
    OK clone with("GET Andrew") respond
  )
  POST := "POST Andrew"
)

job := Object clone do (
  GET := "Programmer"
)

map := list(
  list("name", name),
  list("job", job)
)

test := Framework clone with(map, 8000)
test start