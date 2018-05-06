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

fastboot flash system system.img
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash cache cache.img
fastboot flash userdata userdata.img
fastboot flash vendor vendor.img

exit
