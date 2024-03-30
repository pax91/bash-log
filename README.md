# PAX BASH SCRIPTS COLOURED LOG FUNCTION
## © made by PAX - Luca Passoni

### Description
Import as source the log.sh file into your script.
Call the log function with the following params accepted (uppercase or lowercase) no order required.
You can pass more strings to be printed as rows.
```bash
#!/bin/bash
source log.sh

LN="####################################"
log red blinking "Hello World"
log cyan bold "$LN" "    HELLO WORLD   " "$LN"
log "CIAO"
log YELLOW "PAX"
```
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
wget -O log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh && chmod +x log.sh
```
And add to your bash file with source command
```bash
#!/bin/bash
source log.sh
```
