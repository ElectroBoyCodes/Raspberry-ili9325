#!/bin/bash
#set -x

#for debug
function __echo () {
  echo $1
  echo $1 >> $DrawFile
}

function _echo () {
  echo $1 >> $DrawFile
}

# download image from https://www.365calendar.net/
# List is here https://www.365calendar.net/calendar/list.html#dogBlock
# id = 1126 : 2020 pekingese
# id = 1131 : 2020 miniaturepinscher
# id = 1132 : 2020 yorkshireterrier
# id = 1134 : 2020 nihonken
# id = 1135 : 2020 mix
imageFile="images/dailyImage.jpeg"
python 365calendar.py ${imageFile} 1131

DrawFile="./draw.txt"
if [ -f ${DrawFile} ]; then
  rm $DrawFile
fi

#Inquiry tft information
screen_width=`./draw width`
screen_height=`./draw height`
driver_name=`./draw driver`
echo -n "Your TFT is "
echo -n ${driver_name}
echo -n " "
echo -n ${screen_width}
echo -n "x"
echo ${screen_height}

#Black(0x000000)
_echo "FillScrren,0x0000"
_echo "JPEG,${imageFile}"

./draw $DrawFile > /dev/null
