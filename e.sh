#!/bin/bash
VERSION="3.5.12.9"
if test $# != 1;then
        echo "Usage: $0 dir"
        exit 1;
fi
PREFIX=$1
ARCH="-6"
if test `ldd --version|head -1|awk '{print $NF;}'` = "2.5" ; then
        ARCH="-5"
fi
if test `arch` = "x86_64"; then
        ARCH="$ARCH-x64"
fi
URL="http://github.itzmx.com/1265578519/kangle/master/ent/kangle-ent-$VERSION$ARCH.tar.gz"
wget $URL -O kangle.tar.gz
tar xzf kangle.tar.gz
cd kangle
$PREFIX/bin/kangle -q
killall -9 kangle
sleep 3
mkdir -p $PREFIX
wget http://github.itzmx.com/1265578519/kangle/master/ent/license/Ultimate/license.txt -O $PREFIX/license.txt
./install.sh $PREFIX
$PREFIX/bin/kangle
echo "/vhs/kangle/bin/kangle" >> /etc/rc.d/rc.local
rm -rf $PREFIX/www/index.html
wget http://github.itzmx.com/1265578519/kangle/master/easypanel/index.html -O $PREFIX/www/index.html
$PREFIX/bin/kangle -q
killall -9 kangle
sleep 3
$PREFIX/bin/kangle
