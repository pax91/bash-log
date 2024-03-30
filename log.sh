#!/bin/bash

INI="\033"
RST="$INI[0m"

regular="0"
bold="1"
lowintensity="2"
underline="4"
blinking="5"
reverse="7"
invisible="8"

black="30m"
red="31m"
green="32m"
yellow="33m"
blue="34m"
purple="35m"
cyan="36m"
white="37m"

log() {
    local arr=("$@")
    local lines=()
    local color="0m"
    local mode=$regular
    for opt in "${arr[@]}"; do
        case $opt in
            "BLACK" | "black") 
                color=$black
                ;;
            "RED" | "red") 
                color=$red
                ;;
            "GREEN" | "green") 
                color=$green 
                ;;
            "YELLOW" | "yellow") 
                color=$yellow  
                ;;
            "BLUE" | "blue") 
                color=$blue
                ;;
            "PURPLE" | "purple")
                color=$purple
                ;;
            "CYAN" | "cyan")
                color=$cyan
                ;;
            "WHITE" | "white") 
                color=$white 
                ;;
            "REGULAR" | "regular") 
                mode=$regular 
                ;;
            "BOLD" | "bold") 
                mode=$bold 
                ;;
            "LOWINTENSITY" | "lowintensity") 
                mode=$lowintensity 
                ;;
            "UNDERLINE" | "underline") 
                mode=$underline 
                ;;
            "BLINKING" | "blinking") 
                mode=$blinking 
                ;;
            "REVERSE" | "reverse") 
                mode=$reverse 
                ;;
            "INVISIBLE" | "invisible") 
                mode=$invisible 
                ;;
            *) 
                lines+=("$opt")
                ;;
        esac
    done
    local CLR="$INI[$mode;$color"
    if [[ "${lines[@]}" ]]; then 
        for line in "${lines[@]}"; do
            echo -e "${CLR}$line${RST}"
        done
    else
        echo -e "${CLR} ${RST}"
    fi
}