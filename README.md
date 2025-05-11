# Prog8_blobLink_example
Prog8 Blob Linker Example

This is an example of a very simple utility that can link symbols in a main Prog8 program so that they are accessable from an externally loaded blob.

The utility parses the .vice-mon-list and load the symbol->address table for the main program.
Then it reads a "template" .p8 file which contains memory-mapped variables/arrays as well as extsubs.   The template can include the symbols themselves as opposed to the literal memory addresses.

Then the utility replaces the symbols in the template with the actual addresses.   This outputted file can be %import-ed into the blob for full access of any main program elements desired.

The example makefile shows how the main program, link step and blob can all be built in one make command.
