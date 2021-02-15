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

adb-wait-for-device

adb shell <<EOF
settings put global window_animation_scale 0.3
settings put global transition_animation_scale 0.3
settings put global animator_duration_scale 0.4
EOF