# Basic HTTP Server, as via http://nimrod-lang.org/httpserver.html
import strutils, sockets, httpserver

proc handleRequest(client, path, query): bool {.procvar.} =
  client.send("<!-- Hello. Your Path is: " & path & "-->" & wwwNL)
  echo("Request Made: " & path & "")
  writeFile("data","")
  case path
  of "/":
    client.send("Home" & wwwNL)
  else:
    client.send("404" & wwwNL)
  return false # do not stop processing

run(handleRequest, TPort(8080))

