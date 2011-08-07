Response

name := Object clone do (
  GET := OK clone with("GET Andrew")
  POST := OK clone with ("POST Andrew")
)

job := Object clone do (
  GET := Response clone with("Programmer")
)

map := list(
  list("name", name),
  list("job", job)
)

test := Framework clone with(map, 8000)
test start