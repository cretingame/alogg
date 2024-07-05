#!/bin/bash
# makefile doesn't support creating an .so, and wants to use its own version
# of libogg and libvorbis and there is only one source file so lets DIY
gcc $RPM_OPT_FLAGS -fPIC -DPIC -Iinclude -c alogg.c -o alogg.o
gcc -g -shared -Wl,-soname=libAllegroOGG.so.0 -o libAllegroOGG.so.0 \
	alogg.o -logg -lvorbis -lvorbisfile $(allegro-config --libs)
