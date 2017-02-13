gcc -DHAVE_CONFIG_H -I.. -I/usr/local/include    -Wfloat-equal -Wpointer-arith -DLIBPOSTAL_DATA_DIR='"/opt/apps/libpostal/data2/libpostal"' -g -g -O2 -O3  -MT simple_parse.o -MD -MP  -c -o simple_parse.o `test -f 'simple_parse.c' || echo './'`simple_parse.c

/bin/bash ../libtool  --tag=CC   --mode=link gcc -Wfloat-equal -Wpointer-arith -DLIBPOSTAL_DATA_DIR='"/opt/apps/libpostal/data2/libpostal"' -g -g -O2 -O3   -L/usr/local/lib -o simple_parse  simple_parse.o address_parser-json_encode.o linenoise/address_parser-linenoise.o sparkey/libsparkey.la libscanner.la libpostal.la -lm -lsnappy 
