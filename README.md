# PAX BASH SCRIPTS COLOURED LOG FUNCTION
## © made by PAX - Luca Passoni

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
log
```
### Allowed Params
- inline (Print Strings inline with echo -ne option)
### Allowed Colors (uppercase or lowercase)
- black
- red
- green
- yellow
- blue
- purple
- cyan
- white
### Allowed Modes (uppercase or lowercase)
- regular (Default)
- bold
- lowintensity
- underline
- blinking
- reverse
- invisible
### Installation
Download the script
```
wget -N -O log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh
```
Set the script for global use Import (Update if Exists)
```
mkdir -p ~/.local/bash-log && wget -N -O ~/.local/bash-log/log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh && chmod +x ~/.local/bash-log/log.sh
```
And add to your bash file with source command
```bash
#!/bin/bash
source ~/.local/bash-log/log.sh
```
