---
layout: post
title: Keeping SSH-Connections open, fancy Edition!
tags: linux bash ssh
---
{% highlight sh %}
while true; do date; sleep `rand -s $(date +%N) -M 30`; done
{% endhighlight %}

From `man rand`:

<pre>-s number
       the seed for the random numbers generator (default time(NULL))
-M, --max number
       the limit of the random numbers (default 32576)</pre>

By setting the seed to `date +%N` (nanoseconds) we can avoid getting multiple zeros out of `rand`.
