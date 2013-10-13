---
layout: chapter
post-title: 1 - Starting Out
page-class: "haskell with-contents"
category: haskell
---    
# Starting Out
### Basics
-	Expressions with multiple operators follow normal operator precedence.
	-	Use parentheses to specify the order
-	Boolean stuff is basically what you would expect.
	-	True
	-	False
	-	&amp;&amp; (and)
	-	&#124;&#124; (or)
	-	not (! in other langs)
-	Equality is mostly what you expect, with a simple exception
	- 	&#61;&#61; (equal)
	-	&#47;&#61; (not equal)
-	There is not mixing of types when checking equality. It won't compile.

###Functions
-	Most functions in Haskell are prefix
-	Operators are also functions, but they are infix.
-	To call a function use the name followed by a space and zero or more arguments (separated by spaces)
	-	This returns the smaller of two numbers:			
{% highlight haskell linenos %}
min 9 10
-- 9
{% endhighlight %}
-	You can infix functions by surrounding it in back-ticks &#96;. Important to note, this _is not_ a single quote.
	-	This divides two numbers
{% highlight haskell linenos %}
92 `div` 10
-- 9
{% endhighlight %}
- 	Functions are declared as such: name args = body.
	- 	This is a function declartion for doubling a number
{% highlight haskell linenos %}
doubleMe x = x + x
{% endhighlight %}
-	There is no return statment
-	compile functions using:
{% highlight bash linenos %}
prelude> :l fileName.hs
{% endhighlight %}
-	You can declare multiple functions in a single file.
-	The order you declare functions doesn't matter when calling them, this is totally legit in Haskell:
{% highlight haskell linenos %}
doubleUs x y =  doubleMe x + doubleMe y
doubleMe x = x + x
{% endhighlight %}
-	The basic pattern in Haskell, and probably all functional languages, is to create small functions that can be composed to create complex ones.
-	Imperative languages are a series of steps, Haskell is collection of functions
-	Functions transform data and should always return a value
-	If statement requires then and else.
-	If statements are expressions
-	Expressions always return
	-	5 is an expression. x+y is an expression.
-	An apostrophe at end of function name is a convention used for egear functions or slightly modified version of existing func
-	Functions can't begin with caps
-	Functions that don't have params are "definitions" because they are immutable

###Lists
-	Lists are homogeneous - elements are same type
-	characters are denoted with single quote, string with double. Think C#
-	strings are just lists of characters
-	concat lists with ++
-	when using ++ Haskell walk the whole list on left to find the end. Slow with large lists.
-	use the : (cons) operator to add to front of list.
-	A list like [1,2,3] is sugar for 1:2:3:[]
	-	[] is an empty list
-	use !! and index to get an item out of a list
-	List indexes are zero based.
-	Lists can have lists, length isn't important, but types must match
-	lists are comparable if their items are.
	-	lists are compared item by item starting at their head.
	-	all items must meet the comparison
	-	head returns the first element
	-	tail removes the head and returns the rest
	-	last returns the last element
	-	init drops the last element and returns the rest
		-	Don't use those on empty lists
	-	length returns the length
	-	null does a check for empty, preferred over list == []
	-	reverse reverses a list
	-	take returns a specified number of items from a list
	-	drop removes a specified number of items from the front of a list
	-	maximum returns largest item from a sortable list
	-	minimum returns the smallest
	-	sum sums a list of numbers
	-	product returns the product of a list of numbers
	-	elem takes a thing and a list, tells if the thing is in the list.
-	ranges let you shorthand lists of consecutive things ex. [1..30]
-	ranges let you specify the "step"
{% highlight haskell linenos %}
[2,4..20] 
 -- [2,4,6,8,10,12,14,16,18,20]
{% endhighlight %}
-	the step is the "difference" between the first two items
-	list comprehensions build lists out of functions
{% highlight haskell linenos %}
[x*2 | x <- [1..10]]
{% endhighlight %}
	-	_draws_ an element out of a list and *binds* it to a 'name', the '|' separates the comprehension from the *output*, the *output* is 'action' to tak on each element as it goes into the new list.
	-	comprehensions allow for predicates to be specified at the end. Below doubles all number from 1-10 but only returns ones greater or equal to 12
{% highlight haskell linenos %}
[x*2 | x <- [1..10], x*2 >=12]
{% endhighlight %}
-	you can have multiple predicates separated by commas
	-	this is called filtering
-	You can draw from multiple lists, binding to different names, and performing actions using those names.
	-	when you do this the specified 'action' is performed on each item in listA against each item in listB. It's like nested for(...) loops
-	you can nest list comprehensions in order to act on nested lists. This can be done to perform an action on a list without flattening.

###Tuples		
-	tuples store several heterogenous element
-	have fixed size
-	surrounded by parens, items separated with commas
-	tuples of different sizes are treated as different types
	-	this that tuples in lists must bethe same size, unlike lists of lists.
-	tuples of same length, but different contents are considered different types
-	can be compared if elements can be compared, like lists
-	can't be compared if lengths differ
-	There are a few key functions for working with tuples
	-	fst takes a pair (tuple with 2 elements) returns the first
	-	snd takes a pair and returns the last.
		-	fst and snd only work on pairs
	-	zip takes two lists and returns a list of pairs
		-	joining elements in the same position of each list.
		-	the resulting list only has as  many pairs as the shortest source list
		-	you can use infinite lists