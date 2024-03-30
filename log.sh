#!/bin/bash

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

log() {
    local arr=("$@")
    local lines=()
    local color="0m"
    local mode=$LOG_REGULAR
    local inline=0
    for opt in "${arr[@]}"; do
        case $opt in
            "inline" | "INLINE")
                inline=1
                ;;
            "BLACK" | "black") 
                color=$LOG_BLACK
                ;;
            "RED" | "red") 
                color=$LOG_RED
                ;;
            "GREEN" | "green") 
                color=$LOG_GREEN
                ;;
            "YELLOW" | "yellow") 
                color=$LOG_YELLOW  
                ;;
            "BLUE" | "blue") 
                color=$LOG_BLUE
                ;;
            "PURPLE" | "purple")
                color=$LOG_PURPLE
                ;;
            "CYAN" | "cyan")
                color=$LOG_CYAN
                ;;
            "WHITE" | "white") 
                color=$LOG_WHITE
                ;;
            "REGULAR" | "regular") 
                mode=$LOG_REGULAR
                ;;
            "BOLD" | "bold") 
                mode=$LOG_BOLD
                ;;
            "LOWINTENSITY" | "lowintensity") 
                mode=$LOG_LOWINTENSITY 
                ;;
            "UNDERLINE" | "underline") 
                mode=$LOG_UNDERLINE
                ;;
            "BLINKING" | "blinking") 
                mode=$LOG_BLINKING
                ;;
            "REVERSE" | "reverse") 
                mode=$LOG_REVERSE
                ;;
            "INVISIBLE" | "invisible") 
                mode=$LOG_INVISIBLE
                ;;
            *) 
                lines+=("$opt")
                ;;
        esac
    done
    local CLR="$LOG_INI[$mode;$color"
    if [[ "${lines[@]}" ]]; then 
        for line in "${lines[@]}"; do
            if [ $inline -eq 0 ]; then
                echo -e "${CLR}$line${LOG_RST}"
            else
                echo -ne "${CLR}$line${LOG_RST} "
            fi
        done
    else
        if [ $inline -eq 0 ]; then
            echo -e "${CLR}${LOG_RST}"
        else
            echo -ne "${CLR} ${LOG_RST}"
        fi
    fi
}

logError() {
    log red blinking inline "-> ERROR:"
    log red bold "$1"
}