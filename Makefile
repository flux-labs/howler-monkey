REPO=$(shell pwd)
AQUILA_LIB=$(REPO)/dist/lib/libAquila.a
JSONCPP=./backend/build/jsoncpp/jsoncpp.cpp
CC=clang++
OOURA=$(REPO)/dist/lib/libOoura_fft.a
LIBRARIES=$(OOURA) $(AQUILA_LIB) $(JSONCPP)
CFLAGS=-Wall -Wextra -std=c++11 -g
STD_COMPILE=$(CC) $(CFLAGS) $(LIBRARIES)
PROD_COMPILE=$(CC) $(CLFAGS) -O3 $(LIBRARIES)

./dist/lib/libAquila.a:
	mkdir -p ./dist ./backend/build/aquila;
	(cd ./backend/build/aquila && cmake ../../aquila -DCMAKE_INSTALL_PREFIX="$(REPO)/dist/" && make && make install);

./dist/impulse_response: ./dist/lib/libAquila.a
	$(STD_COMPILE) ./backend/impulse_response.cpp -o ./dist/impulse_respose

aquila: ./dist/lib/libAquila.a

impulse: ./dist/impulse_response

./dist/hello_aquila: ./dist/lib/libAquila.a
	$(STD_COMPILE) ./backend/hello_aquila.cpp -o ./dist/hello_aquila

./dist/hello_jsoncpp: jsoncpp

./dist/output-rays:
	$(STD_COMPILE) ./backend/output-rays/main.cpp -o ./dist/output-rays

jsoncpp:
	python ./backend/jsoncpp/amalgamate.py -s ./backend/build/jsoncpp/jsoncpp.cpp -t ./backend/jsoncpp
	mkdir -p ./dist/include/jsoncpp/
	cp ./backend/build/jsoncpp/json/* ./dist/include/jsoncpp/

test_jsoncpp: ./dist/hello_jsoncpp

all: jsoncpp ./dist/lib/libAquila.a ./dist/output-rays

test_impulse: impulse
	./dist/impulse_respose hello.wav;
	afplay hello.wav;

server:
	(cd ./backend/server && npm i)

start: all server
	(cd ./backend/server && npm start)

clean:
	rm -rf ./backend/build ./dist
