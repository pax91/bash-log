#!/bin/bash

log() {
    # Special Codes
    local INI="\033"
    local RST="$INI[0m"
    # Mode Codes
    local regular="0"
    local bold="1"
    local lowintensity="2"
    local underline="4"
    local blinking="5"
    local reverse="7"
    local invisible="8"
    # Color Codes
    local black="30m"
    local red="31m"
    local green="32m"
    local yellow="33m"
    local blue="34m"
    local purple="35m"
    local cyan="36m"
    local white="37m"
    # Function Variables
    local arr=("$@")
    local lines=()
    local color="0m"
    local mode=$regular
    local inline=0
    for opt in "${arr[@]}"; do
        case $opt in
            "inline" | "INLINE")
                inline=1
                ;;
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
            if [ $inline -eq 0 ]; then
                echo -e "${CLR}$line${RST}"
            else
                echo -ne "${CLR}$line${RST} "
            fi
        done
    else
        if [ $inline -eq 0 ]; then
            echo -e "${CLR}${RST}"
        else
            echo -ne "${CLR} ${RST}"
        fi
    fi
}