#!/bin/bash
sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg && \
sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h  && \
./configure --prefix=/usr \
            --disable-static && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install
