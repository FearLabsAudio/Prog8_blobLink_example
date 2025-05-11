gameLink {

    ; this is set of main program data+subs that you would like 
    ; to be accessable from the blob

    const ubyte                 someNumbers_size    = 14
    &ubyte[someNumbers_size]    someNumbers         = .p8b_main:p8v_someNumbers
    
    extsub .p8b_main:p8s_printNumber = printNumber(ubyte n @ A) clobbers(A,X,Y)

}