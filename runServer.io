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

test := Framework clone with(map, 8000)
test start