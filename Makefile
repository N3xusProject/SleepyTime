HSFILES = $(wildcard src/*.hs)

all: $(HSFILES)
	ghc $(HSFILES) -dynamic -o ./sleepy
	rm src/*.o src/*.hi
