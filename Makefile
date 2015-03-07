#! /usr/bin/make

# Generic Makefile that should work with any program you're going to compile.
# Any complaints should be directed at honghual@sfu.ca
#
# To compile and link your program all you have to do is run 'make' in the
#    current directory.
# To clean up object files run 'make clean_object'.
# To delete any compiled files run 'make clean'.
# Originated in 2001 by Haris Teguh
# modified May-2012 by Honghua Li

# Including of non standard library files:
#   INCLUDEDIR is where the header files can be found
#   LIBDIR is where the library object files can be found
INCLUDEDIR=/usr/include/
LIBDIR=/usr/lib

# If you have more source files add them here 
SOURCE= Tetris.cpp

# The compiler we are using 
CC= g++

# The flags that will be used to compile the object file.
# If you want to debug your program,
# you can add '-g' on the following line
#CFLAGS= -O3 -g -Wall -pedantic -DGL_GLEXT_PROTOTYPES
CFLAGS= -O3 -g -DGL_GLEXT_PROTOTYPES

# The name of the final executable 
EXECUTABLE= FruitTetris3D

# The basic library we are using add the other libraries you want to link
# to your program here 

# Linux (default)
LDFLAGS = -lGL -lglut -lGLEW -lXext -lX11 -lm -lSOIL -lfreetype

# If you have other library files in a different directory add them here 
INCLUDEFLAG= -I. -I$(INCLUDEDIR) -I./include/ -I./include/freetype/include/
LIBFLAG= -L$(LIBDIR) -L./include/SOIL/ -L./include/freetype/lib

# Don't touch this one if you don't know what you're doing 
OBJECT= $(SOURCE:.cpp=.o)

# Don't touch any of these either if you don't know what you're doing 
#all: $(OBJECT) depend
all: $(OBJECT)
	$(CC) $(CFLAGS) $(INCLUDEFLAG) $(LIBFLAG) $(OBJECT) -o $(EXECUTABLE) $(LDFLAGS)

#depend:
#	$(CC) $(INCLUDEFLAG) -M $(SOURCE) > depend

$(OBJECT):
	$(CC) $(CFLAGS) $(INCLUDEFLAG) -c -o $@ $(@:.o=.cpp)

clean_object:
	rm -f $(OBJECT)

clean:
#	rm -f $(OBJECT) depend $(EXECUTABLE)
	rm -f $(OBJECT) $(EXECUTABLE)

#include depend
