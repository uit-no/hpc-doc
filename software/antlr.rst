---
toc: no
title: antlr
...
ANTLR
======

ANother Tool for Language Recognition, is a language tool that provides a
framework for constructing recognizers, interpreters, compilers, and
translators from grammatical descriptions containing actions in a variety of
target languages.

In computer-based language recognition, ANTLR (pronounced Antler), or ANother
Tool for Language Recognition, is a parser generator that uses LL(*) parsing.
ANTLR is the successor to the Purdue Compiler Construction Tool Set (PCCTS),
first developed in 1989, and is under active development. Its maintainer is
professor Terence Parr of the University of San Francisco.

ANTLR takes as input a grammar that specifies a language and generates as
output source code for a recognizer for that language. While version 3
supported generating code in the programming languages Ada95, ActionScript, C,
C#, Java, JavaScript, Objective-C, Perl, Python, Ruby, and Standard ML,[1] the
current release can at present only target Java. A language is specified using
a context-free grammar which is expressed using Extended Backus–Naur Form
(EBNF).

ANTLR allows generating lexers, parsers, tree parsers, and combined
lexer-parsers. Parsers can automatically generate abstract syntax trees which
can be further processed with tree parsers. ANTLR provides a single consistent
notation for specifying lexers, parsers, and tree parsers. This is in contrast
with other parser/lexer generators and adds greatly to the tool's ease of use.


.. vim:ft=rst
