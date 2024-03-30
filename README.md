# PAX BASH SCRIPTS COLOURED LOG FUNCTION
## © made by PAX - Luca Passoni

### Installation
Download the script
```
wget -N -O log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh
```
Set the script for global use Import (Update if Exists)
```
mkdir -p ~/.local/bash-log && wget -N -O ~/.local/bash-log/log.sh https://raw.githubusercontent.com/pax91/bash-log/main/log.sh && chmod +x ~/.local/bash-log/log.sh
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
### Exported Variables Presets
The script will declare these globals variables
```bash
# Special Codes Presets
LOG_INI="\033"
LOG_RST="$LOG_INI[0m"
# Modes Presets
LOG_REGULAR="0"
LOG_BOLD="1"
LOG_LOWINTENSITY="2"
LOG_UNDERLINE="4"
LOG_BLINKING="5"
LOG_REVERSE="7"
LOG_INVISIBLE="8"
# Colors Presets
LOG_BLACK="30m"
LOG_RED="31m"
LOG_GREEN="32m"
LOG_YELLOW="33m"
LOG_BLUE="34m"
LOG_PURPLE="35m"
LOG_CYAN="36m"
LOG_WHITE="37m"
# Regular Colors Presets
REGULAR_BLACK="$LOG_INI[$LOG_BLACK"
REGULAR_RED="$LOG_INI[$LOG_RED"
REGULAR_GREEN="$LOG_INI[$LOG_GREEN"
REGULAR_YELLOW="$LOG_INI[$LOG_YELLOW"
REGULAR_BLUE="$LOG_INI[$LOG_BLUE"
REGULAR_PURPLE="$LOG_INI[$LOG_PURPLE"
REGULAR_CYAN="$LOG_INI[$LOG_CYAN"
REGULAR_WHITE="$LOG_INI[$LOG_WHITE"
# Bold Color Presets
BOLD_BLACK="$LOG_INI[$LOG_BOLD;$LOG_BLACK"
BOLD_RED="$LOG_INI[$LOG_BOLD;$LOG_RED"
BOLD_GREEN="$LOG_INI[$LOG_BOLD;$LOG_GREEN"
BOLD_YELLOW="$LOG_INI[$LOG_BOLD;$LOG_YELLOW"
BOLD_BLUE="$LOG_INI[$LOG_BOLD;$LOG_BLUE"
BOLD_PURPLE="$LOG_INI[$LOG_BOLD;$LOG_PURPLE"
BOLD_CYAN="$LOG_INI[$LOG_BOLD;$LOG_CYAN"
BOLD_WHITE="$LOG_INI[$LOG_BOLD;$LOG_WHITE"
# Blinking Colors Presets
BLINK_BLACK="$LOG_INI[$LOG_BLINKING;$LOG_BLACK"
BLINK_RED="$LOG_INI[$LOG_BLINKING;$LOG_RED"
BLINK_GREEN="$LOG_INI[$LOG_BLINKING;$LOG_GREEN"
BLINK_YELLOW="$LOG_INI[$LOG_BLINKING;$LOG_YELLOW"
BLINK_BLUE="$LOG_INI[$LOG_BLINKING;$LOG_BLUE"
BLINK_PURPLE="$LOG_INI[$LOG_BLINKING;$LOG_PURPLE"
BLINK_CYAN="$LOG_INI[$LOG_BLINKING;$LOG_CYAN"
BLINK_WHITE="$LOG_INI[$LOG_BLINKING;$LOG_WHITE"
```
You can use them into your script, for Example:
```bash
#!/bin/bash
if [ -f ~/.local/bash-log/log.sh ]; then
    source ~/.local/bash-log/log.sh
else
    echo "ERROR: Missign bash-log source"
    echo "See: https://github.com/pax91/bash-log"
    exit 1
fi

printOptions() {
    local arr=("$@")
    local i=0
    for opt in "${arr[@]}"; do
        echo -e " ${BOLD_CYAN}$i)${BOLD_WHITE} $opt${LOG_RST}"  
        ((i+=1))
    done
}
```