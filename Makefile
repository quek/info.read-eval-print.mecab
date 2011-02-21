all:
	swig2.0 -I/usr/include -cffi -module mecab-ffi mecab-ffi.i
