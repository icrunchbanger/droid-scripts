fastboot $* getvar product 2>&1 | grep "^product: *sagit"
if [ $? -ne 0  ] ; then echo "Missmatching image and device"; exit 1; fi
CURRENT_ANTI_VER=1
ver=`fastboot $* getvar anti 2>&1 | grep -oP "anti: \K[0-9]+"`
if [ -z "$ver" ]; then ver=0; fi
if [ $ver -gt $CURRENT_ANTI_VER ]; then echo "current device antirollback version is greater then this pakcage"; exit 1; fi
fastboot $* erase boot
if [ $? -ne 0 ] ; then echo "Erase boot error"; exit 1; fi
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
fastboot $* erase rpm
fastboot $* flash rpm `pwd`/images/rpm.mbn
if [ $? -ne 0 ] ; then echo "Flash rpm error"; exit 1; fi
fastboot $* erase rpmbak
fastboot $* flash rpmbak `pwd`/images/rpm.mbn
if [ $? -ne 0 ] ; then echo "Flash rpmbak error"; exit 1; fi
fastboot $* erase pmic
fastboot $* flash pmic `pwd`/images/pmic.elf
if [ $? -ne 0 ] ; then echo "Flash pmic error"; exit 1; fi
fastboot $* erase pmicbak
fastboot $* flash pmicbak `pwd`/images/pmic.elf
if [ $? -ne 0 ] ; then echo "Flash pmicbak error"; exit 1; fi
fastboot $* erase devcfg
fastboot $* flash devcfg `pwd`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfg error"; exit 1; fi
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
fastboot $* flash dsp `pwd`/images/adspso.bin
if [ $? -ne 0 ] ; then echo "Flash dsp error"; exit 1; fi
fastboot $* erase keymaster
fastboot $* flash keymaster `pwd`/images/keymaster.mbn
if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
fastboot $* erase keymasterbak
fastboot $* flash keymasterbak `pwd`/images/keymaster.mbn
if [ $? -ne 0 ] ; then echo "Flash keymasterbak error"; exit 1; fi
fastboot $* erase logo
fastboot $* flash logo `pwd`/images/logo.img
if [ $? -ne 0 ] ; then echo "Flash logo error"; exit 1; fi
fastboot $* erase splash
fastboot $* flash splash `pwd`/images/splash.img
if [ $? -ne 0 ] ; then echo "Flash splash error"; exit 1; fi
fastboot $* erase misc
fastboot $* flash misc `pwd`/images/misc.img
if [ $? -ne 0 ] ; then echo "Flash misc error"; exit 1; fi
fastboot $* erase system
if [ $? -ne 0 ] ; then echo "Erase system error"; exit 1; fi
fastboot $* erase cache
if [ $? -ne 0 ] ; then echo "Erase cache error"; exit 1; fi
fastboot $* erase userdata
if [ $? -ne 0 ] ; then echo "Erase userdata error"; exit 1; fi
fastboot $* erase recovery
if [ $? -ne 0 ] ; then echo "Erase recovery error"; exit 1; fi
fastboot $* erase sec
if [ $? -ne 0 ] ; then echo "Erase sec error"; exit 1; fi
fastboot $* erase cust
fastboot $* flash cust `pwd`/images/cust.img
if [ $? -ne 0 ] ; then echo "Flash cust error"; exit 1; fi
fastboot $* reboot
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi
sleep 5
fastboot $* erase boot
if [ $? -ne 0 ] ; then echo "Erase boot error"; exit 1; fi
fastboot $* erase recovery
if [ $? -ne 0 ] ; then echo "Erase recovery error"; exit 1; fi
fastboot $* format system
if [ $? -ne 0 ] ; then echo "Format system error"; exit 1; fi
fastboot $* format cache
if [ $? -ne 0 ] ; then echo "Format cache error"; exit 1; fi
fastboot $* format userdata
if [ $? -ne 0 ] ; then echo "Format userdata error"; exit 1; fi
fastboot $* reboot
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi



