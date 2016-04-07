REPO=$(shell pwd)
AQUILA_LIB=$(REPO)/dist/lib/libAquila.a
JSONCPP=./backend/build/jsoncpp/jsoncpp.cpp
CC=clang++
CFLAGS=-Wall -Wextra -std=c++11
LIBRARIES=$(AQUILA_LIB) $(JSONCPP)
STD_COMPILE=$(CC) $(CFLAGS) $(LIBRARIES)
PROD_COMPILE=$(CC) $(CLFAGS) -O3 $(LIBRARIES)

./dist/lib/libAquila.a:
	mkdir -p ./dist ./backend/build/aquila;
	(cd ./backend/build/aquila && cmake ../../aquila -DCMAKE_INSTALL_PREFIX="$(REPO)/dist/" && make && make install);

aquila_test: ./dist/hello_aquila

./dist/hello_aquila: ./dist/lib/libAquila.a
	$(STD_COMPILE) ./backend/hello_aquila.cpp -o ./dist/hello_aquila

./dist/hello_jsoncpp: jsoncpp
	$(STD_COMPILE) ./backend/output-rays/main.cpp -o ./dist/output-rays

jsoncpp:
	python ./backend/jsoncpp/amalgamate.py -s ./backend/build/jsoncpp/jsoncpp.cpp -t ./backend/jsoncpp

test_jsoncpp: ./dist/hello_jsoncpp

all: ./dist/lib/libAquila.a
