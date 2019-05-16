# Wedit Makefile for project arwin
SRCDIR=y:\devsec\shellcoding\windows\addrres
CFLAGS=-I"C:\lcc\include"  -g2 
CC=$(LCCROOT)\bin\lcc.exe
LINKER=$(LCCROOT)\bin\lcclnk.exe
OBJS=\
	arwin.obj

LIBS=
EXE=arwin.exe

$(EXE):	$(OBJS) Makefile
	$(LINKER)  -subsystem console -o $(SRCDIR)\lcc\arwin.exe $(OBJS) $(LIBS)

# Build arwin.c
ARWIN_C=\
	c:\lcc\include\_syslist.h\
	c:\lcc\include\safelib.h\
	c:\lcc\include\string.h\
	c:\lcc\include\safelib.h\
	c:\lcc\include\win.h\
	c:\lcc\include\limits.h\
	c:\lcc\include\stdarg.h\
	c:\lcc\include\ctype.h\
	c:\lcc\include\basetsd.h\
	c:\lcc\include\_syslist.h\

arwin.obj: $(ARWIN_C) $(SRCDIR)\arwin.c
	$(CC) -c $(CFLAGS) $(SRCDIR)\arwin.c

link:
	$(LINKER)  -subsystem console -o $(SRCDIR)\lcc\arwin.exe $(OBJS) $(LIBS)

clean:
	del $(OBJS) arwin.exe
