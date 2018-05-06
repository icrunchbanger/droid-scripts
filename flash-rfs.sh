#!/bin/bash
# Copyright (C) 2017 'icrunchbanger' icrunchbanger@gmail.com

# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

function wait-for-device {
    until adb shell true 2> /dev/null
    do
        sleep 1
    done
}
fastboot erase radio
fastboot erase recovery 
fastboot erase boot
fastboot format cache
fastboot format system
fastboot format userdata
fastboot format vendor
fastboot reboot-bootloader
sleep 5
for file in bootloader*.img; do fastboot flash bootloader $file; done
fastboot reboot-bootloader
sleep 5
for file in radio*.img; do fastboot flash radio $file; done
fastboot reboot-bootloader
sleep 5
for file in vendor*.img; do fastboot flash vendor $file; done
for file in twrp*.img; do fastboot flash recovery $file; done
fastboot boot twrp*.img
wait-for-device
sleep 3
for file in ABC*.zip BeansGapps*.zip Magisk*.zip Font*.zip SSM.zip ADS.zip; do adb push $file /sdcard; done
adb shell twrp install /sdcard/ABC*.zip
adb shell twrp install /sdcard/BeansGapps*.zip
adb shell twrp install /sdcard/Magisk*.zip
adb shell twrp install /sdcard/Font*.zip
adb shell twrp install /sdcard/SSM.zip
adb shell twrp install /sdcard/ADS.zip
adb shell twrp wipe dalvik 
adb shell twrp wipe cache
adb reboot

exit
