---
layout: post
title: "Apache: Redirect if domain name does not match"
tags: apache
---
Redirect everything to dratir.ch:

{% highlight apache %}
RewriteEngine On
Rewritecond %{HTTP_HOST} !^dratir\.com
RewriteRule (.*) http://dratir.com/$1 [QSA,R=301,L]
{% endhighlight %}
