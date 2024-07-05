#!/bin/bash

exit 0

install -m 755 libAllegroOGG.so.0 /usr/local/lib
ln -s libAllegroOGG.so.0 /usr/local/lib/libAllegroOGG.so
install -m 644 AllegroOGG.pc /usr/local/lib/pkgconfig

mkdir -p /usr/local/include/AllegroOGG
install -m 644 include/* /usr/local/include/AllegroOGG
