# Basic HTTP Server, as via http://nimrod-lang.org/httpserver.html

import strutils, sockets, httpserver

var counter = 0
proc handleRequest(client: TSocket, path, query: string): bool {.procvar.} =
  inc(counter)
  client.send("Hello for the $#th time." % $counter & wwwNL)
  return false # do not stop processing

run(handleRequest, TPort(8080))
