---
layout: chapter
post-title: 2 - Believe The Type
page-class: "haskell with-contents"
category: haskell
---    
#Believe The Type

- 	Haskell is a statically typed language.
- 	Each expression's type is known at compile time.
- 	Haskell has type inference
	- 	You don't need to declare the type of an expression. Haskell figures it out.

###Explicit Type Declaration
- 	you can use gchi to examine types of expressions using :t
{% highlight bash %}
ghci> :t 'a'
'a' :: Char
ghci> :t True
True :: Bool
ghci> :t "HELLO!"
"HELLO!" :: [Char]
ghci> :t (True, 'a')
(True, 'a') :: (Bool, Char)
ghci> :t 4 == 5
4 == 5 :: Bool
{% endhighlight %}
-	Types begin with uppercase letters
-	The type of a list is based on the type of the elements in the list.
-	For tuples the type is dynamic. It's based on the number and types of elements in the tuple
	-	The types of two tuples are only the same if the length and all elements are the same
-	Functions have types also
	-	You should give your functions explicit type declarations
{% highlight haskell linenos %}
removeNonUpperCase :: [Char] -> [Char]
removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]
{% endhighlight %}
-	Line one is the type declaration
	-	It says the function takes a single string ([Char]) and returns a single string ([Char])
-	You can specify a type declaration that allows for more than one argument, you just use more arrows
{% highlight haskell linenos %}
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
{% endhighlight %}
-	The return type is always the last type in the declaration
-	You can write a function without a declaration and then run it through ghci with :t to figure out what the type is

###Common Haskell Types

- 	Int is a bounded whole number
	-	Bounded, meaning there is a minimum and maximum value
	-	The size is based on your machine when using GHC to compile
-	Integer is like Int but it is unbound.
	-	It can hold *huge* numbers
	-	It is less performant than Int
	- 	An example of how large an Integer could get
{% highlight haskell linenos %}
factorial :: Integer -> Integer
factorial n = product [1..n]

factorial 50
--30414093201713378043612608166064768844377641568960512000000000000
--That's a big damn number
{% endhighlight %}
-	Float is a real floating-point number with single precision
{% highlight haskell linenos %}
circumference :: Float -> Float
circumference r = 2 * pi * r

circumference 4.0
--25.132742
{% endhighlight %}
-	Double is a real floating-point number with double the precision
	-	If you change the type signature above to Double, the result is 25.132741228718345
-	Bool...you know, True and False.
-	Char is a single Unicode character and it is surrounded by single quotes (like in C#)
-	Tuples are types but the exact type is dynamic, based on the type and number of elements contained within

###Type Variables
-	Type variables allow you to define *generic* type signatures for functions.
-	For example, the signature of the head function
{% highlight bash linenos %}
ghci> :t head
head :: [a] -> a
{% endhighlight %}
-	The 'a' represents a variable rather than a specific type.
	-	The signature says that head takes a list of type 'a' and returns an element of that type
-	You can think of this as Generics in other languages
-	This is how you make polymorphic functions
- Type variables can have any name, but the standard is single characters

###Type Classes
-	Type classes are basically like interfaces in OO langs
-	For example, there is a type class that defines equality
{% highlight bash linenos%}
ghci> :t (==)
(==) :: (Eq a) => a -> a -> Bool
{% endhighlight %}
-	The code above shows a *class constraint* (the =>)
	- Everything before the fat arrow is the constraint
-	The type signature says that == takes to arguments of type 'a', where 'a' is an instance of the 'Eq' type, and returns a Bool.
	-	Side note: operators are really just functions whose name consists of only special characters
	-	Side note: functions that have special character names are infix

####Eq
-	For types that can be test for equality
-	Instances of Eq implement == and /=
	-	This means that the type defines how these functions work with that type.

####Ord
-	For types that can be ordered, for example
{% highlight bash linenos %}
ghci> :t (>)
(>) :: (Ord a) a -> a -> Bool
{% endhighlight %}
-	Instances implement >, <, >= and <=
- Similarly, there is the Ordering type which is returned from the compare function
	- Possible values for Ordering are GT, LT and EQ
{% highlight bash linenos %}
ghci> compare 5 2
GT
{% endhighlight %}

####Show
-	For types that can be represented as strings
-	These types can be used with the show function to convert values to strings

####Read
-	Basically the opposite of show
-	Similarly there is also a read function

#####The read Function
-	It's kind of crazy
-	Takes a string and returns a Read
-	The exact Type can inferred by the code that follows the string argument
{% highlight bash linenos%}
ghci> read "4" + 5
9
ghci> read "True" || False
True
ghci> read "Boo-yah!"

<interactive>:5:1:
    Ambiguous type variable 'a0' in the constraint:
      (Read a0) arising from a use of 'read'
    Probable fix: add a type signature that fixes these type variable(s)
    In the expression: read "Boo-yah!"
    In an equation for 'it': it = read "Boo-yah!"
{% endhighlight %}
-	You can use type annotations to explicitly tell ghc which type to return
{% highlight bash linenos%}
ghci> read "4" :: Int
4
ghci> read "4" :: Float
4.0
{% endhighlight %}
-	Haskell is generally very good at type inference, but occasionally needs help
-	It could figure out the type by evaluating the function, but it is statically typed, so all types need to be known upfront.
####Enum
- 	The types have a sequential order
	-	Things with a known, sequential order can be used in ranges
-	They have defined successors and predecessors
	-	They can be used with the succ and pred functions
-	
