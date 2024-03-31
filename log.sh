#!/bin/bash

# Special Codes Presets
LOG_INI="\033"
LOG_RST="$LOG_INI[0m"
# Modes Presets
LOG_MODES=("regular" "bold" "lowintensity" "italic" "underline" "blink" "blinking" "reverse" "invisible")
# Colors Presets
LOG_COLORS=("black" "red" "green" "yellow" "blue" "purple" "cyan" "white")

isNumber() {
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

isLogColor() {
    if [[ $(echo ${LOG_COLORS[@]} | fgrep -w $1) ]]; then
        return 1
    else
        return 0
    fi
}

isLogMode() {
    if [[ $(echo ${LOG_MODES[@]} | fgrep -w $1) ]]; then
        return 1
    else
        return 0
    fi
}

indexOf() {
    local index=-1
    local search="$1"
    shift
    local arr=("$@")
    if [[ $(echo ${arr[@]} | fgrep -w $search) ]]; then
        local i=0
        for el in "${arr[@]}"; do
            if [[ "$el" == "$search" ]]; then
                index=$i
                break
            else
                ((i++))
            fi
        done
    fi
    echo $index
}

colorCode() {
    local args=("$@")
    local MODE="0"
    local COLOR="0m"
    for arg in "${args[@]}"; do
        if (isLogColor "$arg"); then
            local color_index=$(indexOf "$arg" "${LOG_COLORS[@]}")
            if [ $color_index -gt -1 ]; then
                COLOR="3${color_index}m"
            fi
        elif (isLogMode "$arg"); then
            local mode_index=$(indexOf "$arg" "${LOG_MODES[@]}")
            if [ $mode_index -gt -1 ]; then
                MODE="$mode_index"
            fi
        fi
    done
    echo "$LOG_INI[$MODE;$COLOR"
}

log() {
    local args=("$@")
    local LINES=()
    local COLOR=""
    local MODE="regular"
    local inline=0
    local center=0
    local COLS=$(tput cols)
    for arg in "${args[@]}"; do
        if [[ "$arg" == "center" ]]; then
            center=1
        elif [[ "$arg" == "inline" ]]; then
            inline=1
        elif (isLogColor "$arg"); then
            COLOR="$arg"
        elif (isLogMode "$arg"); then            
            MODE="$arg"
        else
            LINES+=("$arg")
        fi
    done
    local CLR="$(colorCode $COLOR $MODE)"    
    if [[ "${LINES[@]}" ]]; then 
        for line in "${LINES[@]}"; do
            local STR=""
            if [ $center -eq 1 ]; then                
                local n=${#line}
                if [ $COLS -gt $n ]; then
                    local diff=$(($COLS - $n))
                    local spaces=$(($diff / 2))   
                    for ((i=0; i<$spaces; i++)); do
                        STR="$STR "
                    done
                fi
            fi
            STR="$STR$line"               
            if [ $inline -eq 0 ]; then
                echo -e "${CLR}$STR${LOG_RST}"
            else
                echo -ne "${CLR}$STR${LOG_RST} "
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

printLine() {
    local args=("$@")
    local COLOR=""
    local MODE="regular"
    local CHAR="#"
    local COLS=$(tput cols)
    if [[ "${args[@]}" ]]; then
        for arg in "${args[@]}"; do
            if (isNumber $arg); then
                COLS=$arg
            elif (isLogColor "$arg"); then
                COLOR="$arg"
            elif (isLogMode "$arg"); then
                MODE="$arg"                
            elif [ ! -z "$arg" ]; then
                CHAR="$arg"
            fi
        done
    fi   
    local CLR="$(colorCode $COLOR $MODE)"
    local STR=""
    for ((i=0; i<$COLS; i++)); do
        STR="$STR$CHAR" 
    done
    log $COLOR $MODE center "$STR"
}

printMenu() {   
    local args=("$@")
    local MODE="bold"
    local CLR_OPTION=""
    local CLR_DESCR=""
    local OPTIONS=()
    for arg in "${args[@]}"; do
        if (isLogColor "$arg"); then
            if [ -z "$CLR_OPTION" ]; then
                CLR_OPTION="$arg"
            elif [ -z "$CLR_DESCR" ]; then
                CLR_DESCR="$arg"
            else
                OPTIONS+=("$arg")
            fi
        elif (isLogMode "$arg"); then
            MODE="$arg"        
        else
            OPTIONS+=("$arg")
        fi
    done
    local CLR_OPT="$(colorCode $CLR_OPTION $MODE)"
    local CLR_NAM="$(colorCode $CLR_DESCR $MODE)"
    if [[ "${OPTIONS[@]}" ]]; then
        local length=0
        for option in "${OPTIONS[@]}"; do
            echo -e " ${CLR_OPT}$length)${CLR_NAM} $option${LOG_RST}"  
            ((length++))
        done        
    fi
}