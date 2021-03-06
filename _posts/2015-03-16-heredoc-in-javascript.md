---
layout: post
title: "Heredoc in Javascript"
excerpt: Javascript does not like Multiline Strings, but there's a trick!
tags: [javascript,heredoc]
---
Most programming languages have a syntax for defining multiline string literals. Here's an example for Ruby:

{% highlight ruby %}
monty = <<END
It's only a model.
Who's that then?
On second thoughts, let's not go there.
It is a silly place.
END

puts monty.inspect
#=> "It's only a model.\nWho's that then?\nOn second thoughts, let's not go there.\nIt is a silly place.\n"
{% endhighlight %}

Javascript, however, does not have such a syntax. You can just insert newline characters yourself (`\n`), but then you have to escape the actual newline aswell... It's quite messy!

{% highlight javascript %}
var monty = "It's only a model.\n\
Who's that then?\n\
On second thoughts, let's not go there.\n\
It is a silly place.";
{% endhighlight %}

There is, however, a funny hack :)

{% highlight javascript %}
var monty = (function() {/*Well, we did do the nose.
What do you mean?
She looks like one.
You don't vote for kings.
*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

console.log(monty);
//=> Well, we did do the nose.
//=> What do you mean?
//=> She looks like one.
//=> You don't vote for kings.
{% endhighlight %}

And that's how you do Heredocs in Javascript!
