# Prog8_blobLink_example
Prog8 Blob Linker Example

This is an example of a very simple utility that can link symbols in a main Prog8 program so that they are accessable from an externally loaded blob.

The utility parses the .vice-mon-list and load the symbol->address table for the main program.
Then it reads a "template" .p8 file which contains memory-mapped variables/arrays as well as extsubs.   The template can include the symbols themselves as opposed to the literal memory addresses.

Then the utility replaces the symbols in the template with the actual addresses.   This outputted file can be %import-ed into the blob for full access of any main program elements desired.

The example makefile shows how the main program, link step and blob can all be built in one make command.


Usage: gameLinker <template-file> <monlist-file> <output-file>



NOTES on building your link template:

All symbols must be found in .vice-mon-list

Zero page variables are not supported!   
 - The blob should use %zeropage dontuse (see blob.p8 for recommended directives)  
 - Any shared single byte variables should use @nozp in the main program or they may not end up in .vice-mon-list 

Arrays
 - Any uword or word arrays should use @nosplit

Subs
 - Any main program shared subs MUST retain the calling bank.  It's ok to change banks, but they must be restored 
   before returning to the calling blob. Your program WILL crash if you don't do this.  
 - See the Prog8 documentation "Subroutine Calling Convention" under "Technical Details" to determine how to 
   handle extsub parameters.  If there are many parameters, use the @Rx registers, or consider defining them 
   globally and passing them seperately.
