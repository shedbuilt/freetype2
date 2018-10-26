#!/bin/bash
# Patch per BLFS to enable GX/AAT and OpenType table validation as well as Subpixel Rendering
sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h  &&

# Configure
./configure --prefix=/usr \
            --enable-freetype-config \
            --disable-static &&

# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install &&
install -Dm755 builds/unix/freetype-config "${SHED_FAKE_ROOT}/usr/bin/freetype-config"
