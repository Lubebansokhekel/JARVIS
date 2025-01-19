#!/bin/python
folder="/storage/emulated/0/JARVIS"

if [ -d "$folder" ]; then
       clear
       play -q $HOME/JARVIS/sound/salah.mp3 &> /dev/null &
       bash $HOME/JARVIS/logo.sh
       echo
       echo $q $b"           ╔══════════════════════════════════════════════╗$b"
       echo $q $b"           ║$m     SCRIPT TAK DAPAT DI AKSES DI SDCARD     $b ║"
       echo $q $b"           ╚══════════════════════════════════════════════╝$b"
       sleep 5
       echo
       exit 0
fi
clear
q="-e"
e="echo "
s="sleep 1"
ss="sleep 2"
sss="sleep 3"
v="4.2.0"
m="\033[1;31m"
h="\033[1;32m"
k="\033[1;33m"
b="\033[1;34m"
bl="\033[1;36m"
p="\033[1;37m" passwd="dosatol" titid="YDbrtmxuaUwleltmxvuUql2tnylalzcUjbNHHrbgnfmgazxj"
url="xdg-open "

#waktu & Tanggal
jam=$(date +"%k")
tanggal=$(date +" %d %B %Y")
if [[ $jam -ge 0 && $jam -lt 10 ]]; then
       ucapan="Pagi"
       salam="$HOME/JARVIS/sound/pagi.mp3"
elif [[ $jam -ge 10 && $jam -lt 15 ]]; then
       ucapan="Siang"
       salam="$HOME/JARVIS/sound/siang.mp3"
elif [[ $jam -ge 15 && $jam -lt 18 ]]; then
       ucapan="Sore"
       salam="$HOME/JARVIS/sound/siang.mp3"
else
       ucapan="Malam"
       salam="$HOME/JARVIS/sound/malam.mp3"
fi
hari=$(date +%A)
ucap=""
case $hari in
       "Monday") ucap="Senin !" ;;
       "Tuesday") ucap="Selasa !" ;;
       "Wednesday") ucap="Rabu !" ;;
       "Thursday") ucap="Kamis !" ;;
       "Friday") ucap="Jumat !" ;;
       "Saturday") ucap="Sabtu !" ;;
       "Sunday") ucap="Minggu !" ;;
esac
#apikey
shuffle_string() {
       str=$1
       arr=($(echo $str | sed -e 's/\(.\)/\1 /g'))
       for i in $(seq 0 $((${#arr[@]} - 2))); do
              j=$(($(($RANDOM % $((${#arr[@]} - $i)))) + $i))
              tmp=${arr[$i]}
              arr[$i]=${arr[$j]}
              arr[$j]=$tmp
       done
       echo ${arr[@]} | sed -e 's/ //g'
}
allowed_chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
shuffled_chars=$(shuffle_string $allowed_chars)
password_length=10
word=${shuffled_chars:0:$password_length}
# Fungsi untuk memblokir akses ke tombol Ctrl+C, Ctrl+Z, dan Ctrl+D

echo $q $h "                           CHECK UPDATE" &> /dev/null &
#update
function update() {
       git add jarvis.py
       git stash
       git pull origin main
       git add jarvis.py
       git stash
}
update &> /dev/null &
while true; do
       termux_id=$(whoami)
       valid_ids"$HOME/JARVIS/user"
       trap ctrl_c INT
       ctrl_c() {
              clear
              echo $q $k "Anda tidak Bisa$m Keluar$k Dengan cara ini"
              sleep 3
       }
       trap ctrl_z TSTP
       ctrl_z() {
              clear
              echo $q $k "Anda tidak Bisa$m Keluar$k Dengan cara ini"
              sleep 3

       }

       clear
       bash $HOME/JARVIS/logo.sh
       echo
       play -q $HOME/JARVIS/sound/robot2.mp3 &> /dev/null
       play -q $HOME/JARVIS/sound/name_jarvis.mp3 &> /dev/null
       play -q $HOME/JARVIS/sound/robot.mp3 &> /dev/null
       gal="/data/data/com.termux/Idnnrmazjfhekap"
       if [ -f "$gal" ]; then
              #random sound

              echo $q $b"           ╔══════════════════════════════════════════════╗$b"
              echo $q $b"           ║$h     You have been successfully verified     $b ║"
              echo $q $b"           ╚══════════════════════════════════════════════╝$b"
              play -q $HOME/JARVIS/sound/klik.mp3 &> /dev/null

              echo
              echo $q $h "                            CHECK UPDATE"
              play -q /$HOME/JARVIS/sound/jarvis_service.mp3 &> /dev/null &
              sleep 2
              #update
              git stash
              git pull origin main
              git add jarvis.py
              chmod 777 $HOME/JARVIS/menu/*
              cp -r $HOME/JARVIS/menu/* /data/data/com.termux/files/usr/bin
              play -q /$HOME/JARVIS/sound/update.mp3 &> /dev/null
              sleep 2
              cd $HOME/JARVIS/
              clear
              #random wellcome
              sleep 0.1
              clear
              play -q $HOME/JARVIS/sound/hello.mp3 &> /dev/null
              play -q $salam &> /dev/null
              music_files=("welcome.mp3" "galirus.mp3" "terminal.mp3" "kolaborasi.mp3" "dialogue_1.mp3" "dialogue_2.mp3" "dialogue_3.mp3" "dialogue_4.mp3" "dialogue_5.mp3" "dialogue_6.mp3" "dialogue_7.mp3" "dialogue_8.mp3" "emergency.mp3" "help.mp3" "offline.mp3" "ready.mp3" "remind.mp3" "right.mp3" "sleep.mp3" "uh_no.mp3")
              random_index=$((RANDOM % ${#music_files[@]}))
              music_file="${music_files[random_index]}"
              #random angka penguna
              min=100
              max=200
              random_number=$((RANDOM % ($max - $min + 1) + $min))
              bash $HOME/JARVIS/logo2.sh
              play -q $HOME/JARVIS/dialog/$music_file &> /dev/null
              play -q $HOME/JARVIS/sound/robot2.mp3 &> /dev/null
              #menu pilihan
              echo $q $b"╔══════════════════════════════════════════════════╗$b"
              echo $q $b"║$b [$m •$b ]$p Notifikasi  $m  :$k Selamat$m $ucapan$k !$b          $b  ║"
              echo $q $b"║$b [$k •$b ]$p Sekarang Jam$m  :$k $(date +"%H:%M")                     $b ║"
              echo $q $b"║$b [$h •$b ]$p Sekarang Hari$m :$k $ucap,$tanggal$b$b    ║"
              echo $q $b"║$b [$bl •$b ]$p Penguna total$m :$k $random_number                       $b ║"
              echo $q $b"╚══════════════════════════════════════════════════╝$b$h"
              #Menu Pilihan
              cd $HOME
              dialog &> /dev/null
              notif &> /dev/null
              play -q $HOME/JARVIS/sound/klik.mp3 &> /dev/null &
              exit 0

       fi
       #login+program
       #pengantian bash.bashrc
       xdg-open "https://youtu.be/Cvc4jpIre_Y"
       pkg install sox mpv -y
       clear
       cd /data/data/com.termux/files/usr/etc
       mv -f bash.bashrc GALIRUS
       touch bash.bashrc
       galirus="/data/data/com.termux/files/usr/etc/bash.bashrc"
       bashrc="/data/data/com.termux/files/usr/etc/zshrc"
       berhasil="/data/data/com.termux/files/usr/etc/.done"
       perintah() {
echo "cd $HOME/JARVIS"
git pull origin main &> /dev/null 
git stash &> /dev/null
echo "bash jarvis.sh"
echo "cd $HOME"
echo "PS1='\[\e[1;34m\]\[\e[92m\]┌──(\[\e[37m\]G404💀️HUNTER\[\e[92m\])-\[\e[0m\]\[\e[92m\][\e[0m\]\[\e[37m\]\w\[\e[0m\]\[\e[92m\]]\[\e[0m\]\[\[\e[0m\]\n\[\e[92m\]└─≽ \[\e[0m\]'"  
       }
       if [ -f "$galirus" && -f "$berhasil" && -f "$bashrc" ]; then
            continue
                 else
                 touch  /data/data/com.termux/files/usr/etc/zshrc
                 perintah >> /data/data/com.termux/files/usr/etc/zshrc
                 perintah >> /data/data/com.termux/files/usr/etc/bash.bashrc
                 touch $berhasil
       fi
       chmod 777 $HOME/JARVIS/menu/*
       cp -r $HOME/JARVIS/menu/* /data/data/com.termux/files/usr/bin
       clear
       xdg-open "https://sfile.mobi/8Iq7O2UnReh"
       play -q $HOME/JARVIS/sound/robot2.mp3 &> /dev/null &
       bash $HOME/JARVIS/logo.sh
       echo $q $m
       if [[ $(grep -c "$termux_id" "$valid_ids") -eq 1 ]]; then
              play -q $HOME/JARVIS/sound/klik.mp3 &> /dev/null &
              xdg-open "https://wa.me/6285850268349?text=JARVIS%20TERMUX%20Apikey%20ME%20:%20$word"
              read -p "ENTER UNTUK VERIFIKASI | ENTER TO VERIFY"
              clear
              bash $HOME/JARVIS/logo.sh
              echo                                                                        
              echo $q $b"           ╔══════════════════════════════════════════════╗$b"
              echo $q $b"           ║$h  ID TERDAFTAR WELCOME TOO SIR        $b ║"
              echo $q $b"           ╚══════════════════════════════════════════════╝$b"
              touch $gal
              play -q $HOME/JARVIS/sound/robot2.mp3 &> /dev/null
              play -q $HOME/JARVIS/sound/kolaborasi.mp3 &> /dev/null
              echo $q $h "                          MEMUAT ULANG ! | RELOADING "
              sleep 3
       else
              clear
              bash $HOME/JARVIS/logo.sh
              echo                                                                              
              echo $q $b"           ╔══════════════════════════════════════════════╗$b"
              echo $q $b"           ║$m   ID TERMUX ANDA BELUM TERDAFTAR      $b ║"
              echo $q $b"           ╚══════════════════════════════════════════════╝$b"
              play -q $HOME/JARVIS/sound/salah.mp3 &> /dev/null
              play -q $HOME/JARVIS/sound/loginsalah.mp3 &> /dev/null
            exit 0
       fi
done
