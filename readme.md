This is a compact Ada library that can be used for pattern matching with simple regular expressions. 
The implementation is based on the ideas of Brzozowski in the 60's, and the their generalization by Antimirov in the 90's.
The base concept in this library is that of a derivative of a regular expression, an alternative to the classic methods
that need the construction of automata.

TODO: 
 - add formal contracts;
 - provide support for further primitive constructions of families of regular expressions (e.g., complement and intersection)
 - concrete instance for string matching
