:book:

# The Elements of Computing Systems
Doing this as a book club at Odeko, but just the software pieces. We are starting at Chapter 6 Assembler.

# 6 Assembler
- an assembler translates assembly code into binary
- assemblers need to correlate certain symbols to physical locations
  - symbol tables are a well known data structure for it
- symbols can be used for marking locations in the code too (i.e. marking functions or loops)
- symbol translation is what makes assemblers tricky to build
- it seems most computers have a section of memory reserved for instructions and another section for variables
- the words/individual commands of an instruction can each occupy their own area in memory
    - for example, if i=101 goto END -- each part of that command may be spread apart in memory
  - data types must be taken into consideration since a variable may have to take multiple spaces of memory depending on the target hardware
    - the book uses the short and double types from C as an example; you would need four consecutive addresses to represent a double (64bit) on a 16 bit machine
    