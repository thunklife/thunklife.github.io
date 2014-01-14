---
layout: post
post-title: Underline - Array First
excerpt: It seems fitting that the first function I'm going to look at re-implementing is first, also known as head and take...
category: blog
published: false
--- 
#Underline - Array: First

_Underline is a reimplementation of Underscore using currying and recursion. It's an educational experiment. This is the second post in the series._

I trust you know the back-story of this project; if not, [go check it out](underline-introduction.html).

It seems fitting that the first function I'm going to look at re-implementing is <code>first</code>, also known as <code>head</code> and <code>take</code>.

##First
From the Underscore docs:

<blockquote>
	<p><b>_.first(array, [n])</b> Alias: <b>head</b>, <b>take</b></p>
	<p>Returns the first element of an array. Passing n will return the first n elements of the array.</p>
</blockquote>

So <code>first</code> takes an array, and optionally a number of elements to take from the front. If no number is provided, it takes a single element.

For good measure, here are a few examples:

{% highlight javascript %}
var arr = [1,2,3,4,5];
_.first([]); //=> undefined
_.first(arr); //=> 1
_.first(arr, 3); //=> [1,2,3]
_.first(arr, 10); //=> [1,2,3,4,5]
{% endhighlight %}

That should be enough to figure out the base cases.

If you call <code>first</code> with an empty array, you get <code>undefined</code> back. The next case is one I'm not going to support because flipping the arguments means you have to supply the number of elements to take. The last base case is an array with a single item. In that case, you get that item.

##The Solution(s)
So here is what I came up with:

{% highlight javascript linenos %}
var curry = require('curry'),
	concat = Array.prototype.concat;

module.exports = curry(function first(n,arr){
	if(!arr.length) return void 0;
	if(arr.length === 1) return arr[0];

	return take(n, arr.slice(0));
});

function take(n,arr){
	var head;
	if(n <= 0 || !arr.length) return [];
	head = arr.shift();
	
	return concat.call([],head, take(--n, arr));
}
{% endhighlight %}

The code above checks the base cases defined above and then returns the appropriate value. The interesting part comes when neither case is matched. The <code>take</code> function is where all the recursion happens. It's been removed into a separate function because the base cases no longer have to be evaluated. <code>take</code> is called with a copy of the original array, using <code>slice</code>, to ensure the original array remains intact.

Inside <code>take</code> there is a new base case. This case returns an empty array; this is how the array to return is built. If the case isn't met, the first element from the array is removed, and concatenated with the result of recursively calling <code>take</code>. Eventually, the base case will get hit, and the calls will start bubbling up, adding each element to the array in turn.

If you run the same cases as before, the results are the same (with the exception of the optional argument).

This is, of course, the wrong solution.

See the problem with constraints is that sometimes they're all you see. If you say, 'no loops,' suddenly everything looks like it needs recursion. This is the better solution:

{% highlight javascript linenos %}
var curry = require('curry');

module.exports = curry(function first(n,arr){
	if(!arr.length) return void 0;
	if(arr.length === 1) return arr[0];
	
	return arr.slice(0, n);
});
{% endhighlight %}

Much cleaner, and easier to understand. Sure there are going to be instances where recursion is needed, but not when you have things like <code>splice</code> available to you. Still, it's an interesting detour to take; to implement as if native functions didn't exist, but we needn't throw the baby out with the bath water because we can't do loops.

In both solutions, currying the function gives you the benefit of being able to partially apply the function, so you can do stuff like this:

{% highlight javascript %}
var first = require('first'),
	first5 = first(5);

first5([1,2,3,4,5,6,7,8]); //=> [1,2,3,4,5]
{% endhighlight %}

I admit that doesn't look like much here, but it comes in very handy when you want to compose functions later on.

##Next Time
In my text post I'll be taking on <code>initial</code>. It's similar to <code>first</code> in that it takes items from the front of the array, but differs in that it allows you to specify the number of elements from the end to exclude.