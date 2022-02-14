import terminal
import streams
import strutils
import os
import strformat

const blue = ansiForegroundColorCode(fgBlue)
const green = ansiForegroundColorCode(fgGreen)
const reset = ansiResetCode
let pwdFull = getCurrentDir()
let home = getHomeDir()

var result = ""
template write(color: string, text: string) =
  result.add color
  result.add text
result.add blue

if pwdFull.startsWith home:
  result.add "~/"
  result.add pwdFull[home.len..pwdFull.high]
else:
  result.add pwdFull

green.write("\n > ")

result.add reset
stdout.write result

#stdout.write(&"{blue}{pwd}{reset}\n {green}>{reset} <input>\n")
