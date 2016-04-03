#!/bin/sh
#file save date
#DateDownload=$(ls -l wav/ | cut -d ' ' -f 13 | tail -n1)
#Hour=$(echo ${DateDownload}| cut -d ":" -f 1)
#Min=$(echo ${DateDownload}| cut -d ":" -f 2)
#HourPlus=0
#MinPlus=2
#echo ${Hour}+${HourPlus} |bc
#echo ${Min}+${MinPlus} |bc
#file name
n=$(ls -l wav/*.wav | cut -d ' ' -f 14|cut -d '/' -f 2 | wc -l | cut -d ' ' -f 8)
k=$(echo ${n}+1|bc)
#echo ${n}
#echo ${k}
rm tempSoundlist-e.txt
for item in $(ls -l wav/*.wav  | cut -d ' ' -f 14|cut -d '/' -f 2)
do
 echo afplay -v 10 wav/${item} >> tempSoundlist.txt
done

for a in $(seq "$k")
do
  touch SetPlay${a}.sh
  echo \#\!\/bin\/sh >> SetPlay${a}.sh
  cat tempSoundlist.txt| head -n ${a}| tail -n 1 >> SetPlay${a}.sh
  sh SetPlay${a}.sh
  rm SetPlay${a}.sh
done
#at -f SetPlay.sh
#save the last time playlist
cp tempSoundlist.txt tempSoundlist-e.txt
#remove the playlist
echo "" > tempSoundlist.txt
#remove the wav after playing
rm wav/*.wav
