About
=====

Incredibly simple IO web framework

Get started
-----------

Create an instance of the framework:

    framework := Framework clone with(handlers, 8000)

`8000` is the port, `handlers` is a list of lists that map from
regular expression to handler:

    handlers := list(
        list("name", name),
        list("job", job)
    )

The handler objects `name` and `job` just have to respond to HTTP
methods. So, for example:

    name := Object clone do(
        GET := OK clone with("Andrew")
    )

Start the instance with

    framework start
        
