# PAX BASH SCRIPTS COLOURED LOG FUNCTION
## © made by PAX - Luca Passoni

### Description
Import as source the log.sh file into your script.
Call the log function with the following params accepted (uppercase or lowercase) no order required.
```bash
log cyan bold "Hello World"
```
### Allowed Colors
- black
- red
- green
- yellow
- blue
- purple
- cyan
- white
### Allowed Modes
- regular
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
