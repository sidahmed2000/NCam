cmd_/build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn/.install := perl scripts/headers_install.pl /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-3.3.8/include/linux/isdn /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn mips capicmd.h; perl scripts/headers_install.pl /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-3.3.8/include/linux/isdn /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn mips ; perl scripts/headers_install.pl /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-3.3.8/include/generated/linux/isdn /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn mips ; for F in ; do echo "\#include <asm-generic/$$F>" > /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn/$$F; done; touch /build/brcm63xx/build_dir/toolchain-mips_gcc-4.6-linaro_uClibc-0.9.33.2/linux-dev//include/linux/isdn/.install