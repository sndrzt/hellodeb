VER=1.0

compile:
	gcc -g -O0 -o hello hello.c
	rm -rf hello-$(VER)
	mkdir hello-$(VER)
	cp hello hello-$(VER) 
	tar zcf hello_$(VER).tar.gz hello-$(VER)
	cd hello-$(VER); dh_make -e sndrz@outlook.com -f ../hello_$(VER).tar.gz; cd ..

prequisite:
	sudo apt-get install -y build-essential dh-make

build:
	cd hello-$(VER); dpkg-buildpackage

install:
	sudo dpkg -i hello_$(VER)-1_amd64.deb
	dpkg -l hello

test:
	@hello

uninstall:
	sudo dpkg -r hello

clean:
	rm -rf hello.o hello hello-$(VER) hello_$(VER).tar.gz

.PHONY: prequisite compile build

