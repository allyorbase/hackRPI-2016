#!/bin/bash

# while [ 1 ]; do /home/root/android-sdk-linux/platform-tools/adb wait-for-device && python -c 'import display as dis; dis.write("PLease plug in!",255,192,203)' && bash ./root.sh; done
echo "Please plug in!,255,192,203" >> scroller.txt
while [ 1 ]; do  /home/root/android-sdk-linux/platform-tools/adb wait-for-device && bash ./root.sh; done
