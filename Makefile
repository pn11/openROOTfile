CC = g++

# for ROOT
ROOTCFLAGS := $(shell root-config --cflags)
ROOTLIBS := $(shell root-config --libs)
ROOTGLIBS := $(shell root-config --glibs)

# Suffix
.SUFFIXES: .o .cc
.cc.o:
	$(CC) $(ROOTCFLAGS) -c $<

startTBrowser: startTBrowser.o
	$(CC) -Wall -O2 $(ROOTCFLAGS) $(ROOTLIBS) -o $@ $^


clean:
	rm *~ *.o

.PHONY: clean
