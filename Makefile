# Dependencies: prog8 compiler, x16emu, make, java, mtools (all in PATH)

mainSRC      = 	linkDemo.p8
outfile      =  linkDemo.prg

blobSRC      =  blob.p8
outfile_blob =  blob.bin

linkerSRC    =  gameLinker.cpp
linkerAPP    =  gameLinker.exe

prog8c   =  prog8c-11.3.1-all.jar

all: $(outfile) $(linkerAPP)  $(outfile_blob) 

run: $(outfile) $(linkerAPP) $(outfile_blob) 
	clear
	x16emu.exe -prg $(outfile) -run -ram 1024 -scale 2 -joy1 -debug -quality nearest

#program
$(outfile): $(mainSRC) $(prog8c)
	java -jar $(prog8c) -target cx16 $(mainSRC) -asmlist 

#linker
$(linkerAPP): $(linkerSRC)
	g++ -o $(linkerAPP) $(linkerSRC)

#blob
$(outfile_blob): $(linkerAPP) $(blobSRC) $(prog8c)
	./gameLinker.exe
	java -jar $(prog8c) -target cx16 $(blobSRC) -asmlist 

clean:
	rm -f $(outfile) *.vice-mon-list *.asm *.list *.exe *.bin
