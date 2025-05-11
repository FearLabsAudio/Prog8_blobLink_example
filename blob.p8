;
; $A000 library blob
;

%memtop $BFFF
%address $A000
%launcher none
%option no_sysinit
%output library
%zeropage dontuse

%import gameLink


main  {    
    %jmptable (
        main.printAllNumbers,
        main.printAllNumbers_reversed
    )

    sub start() {
        %asm{{nop}}
    }

    sub printAllNumbers () 
    {
        ubyte i
        for i in 0 to (gameLink.someNumbers_size - 1)
            gameLink.printNumber (gameLink.someNumbers[i])
    }

    sub printAllNumbers_reversed () 
    {
        ubyte i
        for i in (gameLink.someNumbers_size - 1) downto 0 
            gameLink.printNumber (gameLink.someNumbers[i])
    }


}


