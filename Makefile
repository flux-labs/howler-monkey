REPO = $(shell pwd)

./dist/lib/aquila.a:
	mkdir -p ./dist ./backend/build/aquila;
	(cd ./backend/build/aquila && cmake ../../aquila -DCMAKE_INSTALL_PREFIX="$(REPO)/dist/" && make && make install);


all: ./dist/lib/aquila.a

