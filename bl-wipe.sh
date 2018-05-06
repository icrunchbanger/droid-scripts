#!/usr/bin/env bash

# Copyright (C) 2017 'icrunchbanger' icrunchbanger@gmail.com

# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

fastboot erase recovery 
fastboot erase boot
fastboot erase cache
fastboot erase system
fastboot erase userdata
fastboot erase vendor
fastboot reboot-bootloader
sleep 5
fastboot erase recovery 
fastboot erase boot
fastboot format cache
fastboot format system
fastboot format userdata
fastboot format vendor
fastboot reboot-bootloader

exit



