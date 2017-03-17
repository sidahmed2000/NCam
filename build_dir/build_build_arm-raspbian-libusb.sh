#!/bin/bash
#
# Copyright (c) 2016 Javier Sayago <admin@lonasdigital.com>
# Contact: javilonas@esp-desarrolladores.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# PREFERENCES FOR SCRIPT
export INIT_TIME=`date +'%d/%m/%y %H:%M:%S'`
export START_TIME=`date +%s`
export TIME_LOG=`date +%Y%m%d_%H%M`
export ROOTFS_PATH=/home/*/NCam
export PARCH_LOGS=$ROOTFS_PATH/build_dir/logs
export ARCH=arm
export target=arm
export NCAM_BIN=ncam-libusb.arm-raspbian
export CROSS=$ROOTFS_PATH/cross/raspbian-toolchain-gcc-4.7.2-linux64/bin/arm-linux-gnueabihf-
export DCMAKE=cross-arm-raspbian-linux-libusb
export SCRIPT=build_arm-raspbian-libusb.sh

export LIBUSB_LIB="$ROOTFS_PATH/cross/raspbian-toolchain-gcc-4.7.2-linux64/arm-raspbian-linux-gnueabi/sysroot/usr/lib/libusb-1.0.a -lrt"
export LIST_SMARGO=list_smargo-*-arm-raspbian-linux-gnueabi-libusb

# BEGIN THE LOG
cd $PARCH_LOGS/
echo ">> LOG BUILD $NCAM_BIN >>" >> .build_$NCAM_BIN.$TIME_LOG.log 2>&1 || exit -1
(
echo ""
echo ""
echo "=============================================="
echo "   ASSIGNING PERMISSIONS"
echo "=============================================="
echo ""
echo ""
find . -type f -name '*.h' -exec chmod 644 {} \; > /dev/null 2>&1
find . -type f -name '*.c' -exec chmod 644 {} \; > /dev/null 2>&1
find . -type f -name '*.sh' -exec chmod 755 {} \; > /dev/null 2>&1
chmod 777 $PARCH_LOGS > /dev/null 2>&1
chmod 777 $ROOTFS_PATH/build > /dev/null 2>&1
chmod 777 $ROOTFS_PATH/Distribution > /dev/null 2>&1
sleep 0.8s
sync
echo " Permissions applied correctly"
echo ""
echo ""
echo "=============================================="
echo "   REMOVE OLD REMAINS"
echo "=============================================="
echo ""
echo ""
rm -f $ROOTFS_PATH/Distribution/$LIST_SMARGO > /dev/null 2>&1
rm -f $ROOTFS_PATH/Distribution/$NCAM_BIN > /dev/null 2>&1
rm -f $ROOTFS_PATH/Distribution/$NCAM_BIN.debug > /dev/null 2>&1
sh ./clean_all.sh > /dev/null 2>&1
sleep 0.8s
sync
echo " Cleaning performed correctly"
echo ""
echo ""
sleep 0.8s
sync
cd $ROOTFS_PATH
echo ""
echo "=============================================="
echo "   START : BUILD"
echo "=============================================="
echo ""
echo ""
echo " starting Compilation"
echo ""
sleep 0.8s
sync
echo "+-------------------------------------------------------------------------------"
nice -n 10 make NCAM_BIN=$NCAM_BIN ARCH=$ARCH target=$target -j`grep 'processor' /proc/cpuinfo | wc -l` $DCMAKE || exit 1
sleep 0.8s
sync
echo ""
echo "=============================================="
echo "   END   : BUILD"
echo "=============================================="
echo ""
echo ""
find . -name "$NCAM_BIN*" -exec cp -av {} $ROOTFS_PATH/Distribution/ \; > /dev/null 2>&1
sleep 0.5s
sync
rm -f $NCAM_BIN > /dev/null 2>&1
rm -f $NCAM_BIN.debug > /dev/null 2>&1
rm -f $ROOTFS_PATH/Distribution/$NCAM_BIN.debug > /dev/null 2>&1
rm -f $ROOTFS_PATH/Distribution/$LIST_SMARGO > /dev/null 2>&1
rm -r $ROOTFS_PATH/build/* > /dev/null 2>&1
chmod 755 $ROOTFS_PATH/build_dir/$SCRIPT > /dev/null 2>&1
sleep 0.5s
sync
END_TIME=`date +%s`
echo ""
echo "Build Ncam Started  : $INIT_TIME"
echo "Build Ncam Finished : `date +'%d/%m/%y %H:%M:%S'`"
let "ELAPSED_TIME=$END_TIME-$START_TIME"
echo "Total compile time is $ELAPSED_TIME seconds"
echo ""
find . -name "$NCAM_BIN*"
echo ""
) 2>&1	 | tee -a .build_$NCAM_BIN.$TIME_LOG.log
