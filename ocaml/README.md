# Books
+ The OCaml system https://ocaml.org/releases/4.11/htmlman/index.html>
+ Real World OCaml <https://dev.realworldocaml.org/>
+ Cornell CS 3110 <https://www.cs.cornell.edu/courses/cs3110/2020fa/textbook/>

# How to compile an OCaml program

| Purpose         | The C lang | Byte-code | Native code |
| --------------- | ---------- | --------- | ----------- |
| Source code     | *.c        | *.ml      | *.ml        |
| Header files    | *.h        | *.mli     | *.mli       |
| Object files    | *.o        | *.cmo     | *.cmx2      |
| Library files   | *.a        | *.cma     | *.cmxa3     |
| Binary programs | prog       | prog      | prog.opt    |

+ ocamlc => byte-code compiler
+ ocamlopt => native code compiler

Use `Tuareg` inside Emacs then you can interactively run partial of the `.ml` files.

REPL =>`utop`

# Other related links

* [Xavier Leroy](https://xavierleroy.org/)

# Misc

## `Core` or `Std` or `Batteries`?

The std lib bundled with OCaml is like 30 years old, and was sufficient back to the days.

To ease your life, using `core` and `batteries` are desired.

However, Jane Street's `core` don't have detailed doc, and is very large like ANSI Common Lisp Spec.

The source code of inria std is actually here and its quite elegent: https://github.com/ocaml/ocaml/tree/trunk/stdlib
