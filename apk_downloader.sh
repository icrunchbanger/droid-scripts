#!/usr/bin/env bash
# Copyright (C) 2020 'icrunchbanger' icrunchbanger@gmail.com
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

echo -e "
**************************
Downloading Slide For Reddit
**************************
"
package_name="me.ccrama.redditslide"
package_url="https://f-droid.org/en/packages/${package_name}/"
package_repo="https://f-droid.org/repo/"
package_ver="$(curl -s {$package_url} | grep Version | head -n 1  | cut -d '(' -f 2 | cut -d ')' -f 1)"
wget "${package_repo}${package_name}_${package_ver}.apk"

echo -e "
**************************
Downloading  KeePass DX
**************************
"
package_name="com.kunzisoft.keepass.libre"
package_url="https://f-droid.org/en/packages/${package_name}/"
package_repo="https://f-droid.org/repo/"
package_ver="$(curl -s {$package_url} | grep Version | head -n 1  | cut -d '(' -f 2 | cut -d ')' -f 1)"
wget "${package_repo}${package_name}_${package_ver}.apk"

echo -e "
**************************
Downloading  Forecastie
**************************
"
package_name="cz.martykan.forecastie"
package_url="https://f-droid.org/en/packages/${package_name}/"
package_repo="https://f-droid.org/repo/"
package_ver="$(curl -s {$package_url} | grep Version | head -n 1  | cut -d '(' -f 2 | cut -d ')' -f 1)"
wget "${package_repo}${package_name}_${package_ver}.apk"

echo -e "
**************************
Downloading  Termux
**************************
"
package_name="com.termux"
package_url="https://f-droid.org/en/packages/${package_name}/"
package_repo="https://f-droid.org/repo/"
package_ver="$(curl -s {$package_url} | grep Version | head -n 1  | cut -d '(' -f 2 | cut -d ')' -f 1)"
wget "${package_repo}${package_name}_${package_ver}.apk"

echo -e "
**************************
Downloading  QR Scanner
**************************
"
package_name="com.secuso.privacyFriendlyCodeScanner"
package_url="https://f-droid.org/en/packages/${package_name}/"
package_repo="https://f-droid.org/repo/"
package_ver="$(curl -s {$package_url} | grep Version | head -n 1  | cut -d '(' -f 2 | cut -d ')' -f 1)"
wget "${package_repo}${package_name}_${package_ver}.apk"

#echo -e "
#**************************
#Downloading  Firefox Fenix
#**************************
#"
#curl -s https://api.github.com/repos/mozilla-mobile/fenix/releases/latest\
#| grep "browser_download_url.*arm64.apk"\
#| cut -d : -f 2,3 \
#| tr -d \" \
#| wget -qi -