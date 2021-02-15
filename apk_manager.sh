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
pm uninstall -k --user 0 com.aurora.store
pm uninstall -k --user 0 org.fdroid.fdroid.privileged
pm uninstall -k --user 0 org.fdroid.fdroid
pm uninstall -k --user 0 com.android.stk
pm uninstall -k --user 0 com.android.camera2
pm uninstall -k --user 0 org.lineageos.jelly
pm uninstall -k --user 0 org.lineageos.snap
pm uninstall -k --user 0 com.google.android.googlequicksearchbox
pm uninstall -k --user 0 com.android.email
EOF

for file in *.apk; do adb install $file; done
