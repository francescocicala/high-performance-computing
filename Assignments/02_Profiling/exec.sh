cc -Wall -Wshadow -pg   -c -o test.o test.c
cc -Wall -Wshadow -pg   -c -o genann.o genann.c
cc   test.o genann.o  -lm -o test.x

cc -Wall -Wshadow -pg   -c -o example1.o example1.c
cc   example1.o genann.o  -lm -o example1.x

rm *.o

