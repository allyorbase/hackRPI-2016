import pyupm_i2clcd as lcd
import os

def write(string,r,g,b):
    # input is assumed to be a list of 4
    lcd.clear()
    # lcd.setcursor(0,0)
    lcd.setColor(r,g,b)
    lcd.write(string)

lcd = lcd.Jhd1313m1(0,0x3E,0x62)
# lcd.setcursor(0,0)
lcd.clear()
while True:
    if os.path.isfile('scroller.txt'):
        lcd.clear()
        # lcd.setCursor(0,0)
        text = open('scroller.txt')
        text = text.readline()
        text = text.strip()
        text = text.split(',')
        print(text)
        text[1] = int(text[1])
        text[2] = int(text[2])
        text[3] = int(text[3])
        write(*text) # asterisk breaks down the list into bite-sized pieces for our function
        os.remove('scroller.txt')

