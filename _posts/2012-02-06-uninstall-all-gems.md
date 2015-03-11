---
layout: post
title: "Uninstall all GEMs"
tags: gem bash
---
Because the solutions I googled didn’t work:

{% highlight sh %}
for g in `gem list --no-versions`; do
  gem uninstall --all --ignore-dependencies --executables $g
done
{% endhighlight %}
