%zeropage basicsafe
%option no_sysinit 


%import textio
%import conv
%import diskio

%import blob_import


;main program

main  {     

    %option force_output

    const ubyte someNumbers_size = 14
    ubyte[someNumbers_size] someNumbers = [3,1,4,1,5,9,2,6,5,3,5,8,7,9]
    

    sub start () 
    {

        blob.load()  ;initialize the blob

        txt.clear_screen()
        txt.home()
        blob.printAllNumbers()
        txt.nl()
        blob.printAllNumbers_reversed()
        txt.nl()

    }


    sub printNumber(ubyte n)
    {
        txt.print(conv.str_ub(n))
        txt.nl()
    }



}



