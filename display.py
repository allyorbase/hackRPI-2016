import socket
import fcntl
import struct
import pyupm_i2clcd as lcd
import time

global lcd

lcd = lcd.Jhd1313m1(0,0x3E,0x62)
lcd.clear()
lcd.setCursor(0,0)
def timer():
    lcd.clear()
    seconds = 0
    while True:
        lcd.setCursor(0,0)
        lcd.write('Time elapsed:')
        lcd.setCursor(1,0)
        lcd.write('{} Seconds'.format(seconds))
        time.sleep(1)
        seconds += 1

def outcome(bool):
    lcd.clear()
    if bool == 0:
        lcd.setColor(255,255,0)
        lcd.write('Success!')
    else:
        lcd.setColor(255,0,0)
        lcd.write('Fatal error :( ')

def write(string,red,green,blue):
    lcd.clear()
    lcd.setColor(red,green,blue)
    lcd.write(string)

