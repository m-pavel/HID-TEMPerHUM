all:	temper

CFLAGS = -O2 -Wall

temper:	temper.c temper.h
	${CC} -c -Wall  -fpic temper.c 
	${CC} -DUNIT_TEST -shared -o libtemper.so temper.o -lusb -lm

clean:		
	rm -f libtemper.so *.o


rules-install:			# must be superuser to do this
	cp 99-tempsensor.rules /etc/udev/rules.d
