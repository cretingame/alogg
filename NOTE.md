## Info from fedora

## build
 makefile doesn't support creating an .so, and wants to use its own version
 of libogg and libvorbis and there is only one source file so lets DIY
```bash
gcc $RPM_OPT_FLAGS -fPIC -DPIC -Iinclude -c src/alogg.c -o src/alogg.o
gcc -g -shared -Wl,-soname=lib%{name}.so.0 -o lib%{name}.so.0 \
  src/alogg.o -logg -lvorbis -lvorbisfile $(allegro-config --libs)
```

## install

```bash
mkdir -p $RPM_BUILD_ROOT%{_libdir}/pkgconfig
install -m 755 lib%{name}.so.0 $RPM_BUILD_ROOT%{_libdir}
ln -s lib%{name}.so.0 $RPM_BUILD_ROOT%{_libdir}/lib%{name}.so
install -m 644 %{name}.pc $RPM_BUILD_ROOT%{_libdir}/pkgconfig

mkdir -p $RPM_BUILD_ROOT%{_includedir}/%{name}
install -m 644 include/* $RPM_BUILD_ROOT%{_includedir}/%{name}
```

https://koji.fedoraproject.org/koji/buildinfo?buildID=2366580
