---
layout: chapter
post-title: 0 - Introduction
page-class: "haskell with-contents"
category: haskell
---    
#Introduction

-	Haskell is _purely functional_
	-	You can't change values once assigned
	-	Functions have no side effects
-	Haskell is lazy. It doesn't execute functions until you ask for result
	-	This allows you to make seemingly infinite data structures.
	-	Only what you ask for is returned and only when you ask for it
-	Haskell is statically typed, but has type inference.
	-	You don't need to declare types
-	Glasgow Haskell Compiler (GHC) is the most popular compiler.
-	Download the [Haskell Platform](http://www.haskell.org/platform/)
	- 	Lots of Linux distros have a package in their repos if you prefer that
-	GHC can compile Haskell files (.hs), and has an interactive mode (ghci in the terminal)
	-	Compile files in ghci with :l &lt;filename&gt;
	-	Then you can access functions in ghci
