#!/usr/bin/env bash
# Copyright (C) 2020 'icrunchbanger' icrunchbanger@gmail.com
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

function adb-wait-for-device {
    until adb shell true 2> /dev/null
    do
        sleep 1
    done
}

function fastboot-wait-for-device {
    until fastboot devices true 2> /dev/null
    do
        sleep 1
    done
}

fastboot-wait-for-device

fastboot set_active a; fastboot -w; fastboot erase boot; fastboot erase system; fastboot format; fastboot erase userdata; fastboot format userdata
fastboot set_active b; fastboot -w; fastboot erase boot; fastboot erase system; fastboot format; fastboot erase userdata; fastboot format userdata
fastboot set_active a
unzip sailfish-*.zip
cd sailfish-*/
sed -i '/update/ s/$/ --skip-reboot/' flash-all.sh
./flash-all.sh
cd ..
fastboot boot twrp-*.img

adb-wait-for-device

adb shell twrp wipe data
adb shell twrp wipe system
adb push lineage-*.zip /sdcard
adb push twrp-*.zip /sdcard
adb shell twrp install /sdcard/lineage-*.zip
adb shell twrp install /sdcard/twrp-*.zip
adb reboot recovery

adb-wait-for-device

adb push open_gapps-arm64-*.zip /sdcard
adb shell twrp install /sdcard/open_gapps-arm64-*.zip
adb push Magisk-*.zip /sdcard
adb shell twrp install /sdcard/Magisk-*.zip
adb reboot

exit