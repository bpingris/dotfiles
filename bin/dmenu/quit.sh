#!/bin/sh

echo '
{
  "prompt": "Chose an action",
  "entries": [
             {
               "id": "Suspend",
               "command": "echo suspend"
             },
             {
               "id": "Logoff",
               "command": "echo logoff"
             }
  ]
}
'
