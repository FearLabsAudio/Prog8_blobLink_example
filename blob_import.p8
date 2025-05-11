blob  {

    ;this is %import-ed by the main program to load and call subs in the blob

    str FILENAME_BLOB =  "blob.bin"
    const ubyte blob_bank = 2

    extsub @bank blob_bank $A000 = lib_init() clobbers(A)
    extsub @bank blob_bank $A003 = printAllNumbers() clobbers(A,X,Y)
    extsub @bank blob_bank $A006 = printAllNumbers_reversed() clobbers(A,X,Y)
        

    sub load()
    {
        cx16.rambank(blob_bank)   
        void diskio.load_raw(FILENAME_BLOB, $a000) 
        lib_init()   
    }
    
}
