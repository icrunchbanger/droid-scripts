#!/usr/bin/env bash
# Copyright (C) 2020 'icrunchbanger' icrunchbanger@gmail.com
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

function adb-wfd {
    until adb shell true 2> /dev/null
    do
        sleep 1
    done
}

function fastboot-wfd {
    until fastboot devices true 2> /dev/null
    do
        sleep 1
    done
}

fastboot $* -w
fastboot $* erase boot
fastboot $* erase recovery
fastboot $* erase system

fastboot $* reboot bootloader
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi

fastboot-wfd

CURRENT_ANTI_VER=1
ver=`fastboot $* getvar anti 2>&1 | grep -oP "anti: \K[0-9]+"`
if [ -z "$ver" ]; then ver=0; fi
if [ $ver -gt $CURRENT_ANTI_VER ]; then echo "current device antirollback version is greater then this pakcage"; exit 1; fi
fastboot $* getvar product 2>&1 | grep "^product: *raphael"
if [ $? -ne 0  ] ; then echo "Missmatching image and device"; exit 1; fi
fastboot $* format cache
if [ $? -ne 0 ] ; then echo "Format cache error"; exit 1; fi
fastboot $* format userdata
if [ $? -ne 0 ] ; then echo "Format userdata error"; exit 1; fi
fastboot $* flash crclist `pwd`/images/crclist.txt
if [ $? -ne 0 ] ; then echo "Flash crclist error"; exit 1; fi
fastboot $* flash sparsecrclist `pwd`/images/sparsecrclist.txt
if [ $? -ne 0 ] ; then echo "Flash sparsecrclist error"; exit 1; fi
fastboot $* erase xbl
fastboot $* flash xbl `pwd`/images/xbl.elf
if [ $? -ne 0 ] ; then echo "Flash xbl error"; exit 1; fi
fastboot $* erase xblbak
fastboot $* flash xblbak `pwd`/images/xbl.elf
if [ $? -ne 0 ] ; then echo "Flash xblbak error"; exit 1; fi
fastboot $* erase xbl_config
fastboot $* flash xbl_config `pwd`/images/xbl_config.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_config error"; exit 1; fi
fastboot $* erase xbl_configbak
fastboot $* flash xbl_configbak `pwd`/images/xbl_config.elf
if [ $? -ne 0 ] ; then echo "Flash xbl_configbak error"; exit 1; fi
fastboot $* erase abl
fastboot $* flash abl `pwd`/images/abl.elf
if [ $? -ne 0 ] ; then echo "Flash abl error"; exit 1; fi
fastboot $* erase ablbak
fastboot $* flash ablbak `pwd`/images/abl.elf
if [ $? -ne 0 ] ; then echo "Flash ablbak error"; exit 1; fi
fastboot $* erase tz
fastboot $* flash tz `pwd`/images/tz.mbn
if [ $? -ne 0 ] ; then echo "Flash tz error"; exit 1; fi
fastboot $* erase tzbak
fastboot $* flash tzbak `pwd`/images/tz.mbn
if [ $? -ne 0 ] ; then echo "Flash tzbak error"; exit 1; fi
fastboot $* erase hyp
fastboot $* flash hyp `pwd`/images/hyp.mbn
if [ $? -ne 0 ] ; then echo "Flash hyp error"; exit 1; fi
fastboot $* erase hypbak
fastboot $* flash hypbak `pwd`/images/hyp.mbn
if [ $? -ne 0 ] ; then echo "Flash hypbak error"; exit 1; fi
fastboot $* erase devcfg
fastboot $* flash devcfg `pwd`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfg error"; exit 1; fi
fastboot $* erase devcfgbak
fastboot $* flash devcfgbak `pwd`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfgbak error"; exit 1; fi
fastboot $* erase storsec
fastboot $* flash storsec `pwd`/images/storsec.mbn
if [ $? -ne 0 ] ; then echo "Flash storsec error"; exit 1; fi
fastboot $* erase bluetooth
fastboot $* flash bluetooth `pwd`/images/BTFM.bin
if [ $? -ne 0 ] ; then echo "Flash bluetooth error"; exit 1; fi
fastboot $* erase cmnlib
fastboot $* flash cmnlib `pwd`/images/cmnlib.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib error"; exit 1; fi
fastboot $* erase cmnlibbak
fastboot $* flash cmnlibbak `pwd`/images/cmnlib.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlibbak error"; exit 1; fi
fastboot $* erase cmnlib64
fastboot $* flash cmnlib64 `pwd`/images/cmnlib64.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib64 error"; exit 1; fi
fastboot $* erase cmnlib64bak
fastboot $* flash cmnlib64bak `pwd`/images/cmnlib64.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib64bak error"; exit 1; fi
fastboot $* erase modem
fastboot $* flash modem `pwd`/images/NON-HLOS.bin
if [ $? -ne 0 ] ; then echo "Flash modem error"; exit 1; fi
fastboot $* erase dsp
fastboot $* flash dsp `pwd`/images/dspso.bin
if [ $? -ne 0 ] ; then echo "Flash dsp error"; exit 1; fi
fastboot $* erase metadata
fastboot $* flash metadata `pwd`/images/metadata.img
if [ $? -ne 0 ] ; then echo "Flash metadata error"; exit 1; fi
fastboot $* erase keymaster
fastboot $* flash keymaster `pwd`/images/km4.mbn
if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
fastboot $* erase keymasterbak
fastboot $* flash keymasterbak `pwd`/images/km4.mbn
if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
fastboot $* erase logo
fastboot $* flash logo `pwd`/images/logo.img
if [ $? -ne 0 ] ; then echo "Flash logo error"; exit 1; fi
fastboot $* erase misc
fastboot $* flash misc `pwd`/images/misc.img
if [ $? -ne 0 ] ; then echo "Flash misc error"; exit 1; fi
fastboot $* erase aop
fastboot $* flash aop `pwd`/images/aop.mbn
if [ $? -ne 0 ] ; then echo "Flash aop error"; exit 1; fi
fastboot $* erase aopbak
fastboot $* flash aopbak `pwd`/images/aop.mbn
if [ $? -ne 0 ] ; then echo "Flash aopbak error"; exit 1; fi
fastboot $* erase qupfw
fastboot $* flash qupfw `pwd`/images/qupv3fw.elf
if [ $? -ne 0 ] ; then echo "Flash qupfw error"; exit 1; fi
fastboot $* erase qupfwbak
fastboot $* flash qupfwbak `pwd`/images/qupv3fw.elf
if [ $? -ne 0 ] ; then echo "Flash qupfwbak error"; exit 1; fi
fastboot $* erase imagefv
fastboot $* flash imagefv `pwd`/images/imagefv.elf
if [ $? -ne 0 ] ; then echo "Flash imagefv error"; exit 1; fi
fastboot $* erase uefisecapp
fastboot $* flash uefisecapp `pwd`/images/uefi_sec.mbn
if [ $? -ne 0 ] ; then echo "Flash uefisecapp error"; exit 1; fi
fastboot $* erase uefisecappbak
fastboot $* flash uefisecappbak `pwd`/images/uefi_sec.mbn
if [ $? -ne 0 ] ; then echo "Flash uefisecappbak error"; exit 1; fi
fastboot $* erase multiimgoem
fastboot $* flash multiimgoem `pwd`/images/multi_image.mbn
if [ $? -ne 0 ] ; then echo "Flash multiimgoem error"; exit 1; fi
fastboot $* erase vendor
fastboot $* flash vendor `pwd`/images/vendor.img
if [ $? -ne 0 ] ; then echo "Flash vendor error"; exit 1; fi
fastboot $* erase vbmeta
fastboot $* flash vbmeta `pwd`/images/vbmeta.img
if [ $? -ne 0 ] ; then echo "Flash vbmeta error"; exit 1; fi
fastboot $* erase dtbo
fastboot $* flash dtbo `pwd`/images/dtbo.img
if [ $? -ne 0 ] ; then echo "Flash dtbo error"; exit 1; fi
fastboot $* format system
fastboot $* flash system `pwd`/images/system.img
if [ $? -ne 0 ] ; then echo "Flash system error"; exit 1; fi
fastboot $* erase secdata
if [ $? -ne 0 ] ; then echo "Erase secdata error"; exit 1; fi
fastboot $* erase cust
fastboot $* flash cust `pwd`/images/cust.img
if [ $? -ne 0 ] ; then echo "Flash cust error"; exit 1; fi
fastboot $* reboot bootloader
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi

fastboot-wfd

fastboot $* boot twrp-*.img

adb-wfd

adb shell twrp wipe factoryreset

adb push twrp-*.img /sdcard/twrp.img
adb shell dd if=/sdcard/twrp.img of=/dev/block/bootdevice/by-name/recovery

adb reboot recovery

adb-wfd

adb push lineage-*.zip /sdcard
adb push Magisk-*.zip /sdcard
adb push open_gapps-arm64-*.zip /sdcard
adb shell twrp install /sdcard/lineage-*.zip
adb shell twrp install /sdcard/Magisk-*.zip
adb shell twrp install /sdcard/open_gapps-arm64-*.zip

adb shell twrp wipe dalvik 
adb shell twrp wipe cache

adb $* reboot