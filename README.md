# PAX BASH SCRIPTS COLOURED LOG FUNCTION
## © made by PAX - Luca Passoni

### Installation
Download the script
```bash
wget -O log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh
```
Set the script for global use Import (Update if Exists)
```bash
mkdir -p ~/.local/bash-log && rm ~/.local/bash-log/log.sh && wget -O ~/.local/bash-log/log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh && chmod +x ~/.local/bash-log/log.sh
```
### Description
This script allow you to call the log function to print coloured output to your bash script into terminal.
Import as source the log.sh file into your script.
Call the log function with the accepted params, no order required.
You can pass more strings to be printed as rows. See Example below.
```bash
#!/bin/bash
source ~/.local/bash-log/log.sh

LN="####################################"
log red blinking "Hello World"
log cyan bold "$LN" "            HELLO WORLD" "$LN"
log 
log inline "CIAO" " "
log YELLOW inline "PAX"
log cyan bold "$LN"
```
### Exported Functions
- isNumber
- isLogMode
- isLogColor
- indexOf
- colorCode
- log
- printLine
- printMenu
### Allowed Params (lowercase)
- inline (Print Strings inline with echo -ne option)
- center (Print Strings centered the window)
### Allowed Colors (lowercase)
- black
- red
- green
- yellow
- blue
- purple
- cyan
- white
### Allowed Modes (lowercase)
- regular (Default)
- bold
- lowintensity
- italic
- underline
- blink
- blinking
- reverse
- invisible