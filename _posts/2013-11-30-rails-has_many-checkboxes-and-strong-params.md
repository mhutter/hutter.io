---
layout: post
title: "Rails has_many and Strong Params"
tags: [rails]
---
For a recent Rails project I had the following setup:

{% highlight ruby %}
class Pager < ActiveRecord::Base
  has_and_belongs_to_many :users
  # rest ommited for brevity
end
{% endhighlight %}

In my view, I want to select 0-n users. Actually the first challenge was to create the checkboxes in a way the selected options get submitted as an array. It's been ages since I last used checkboxes!

{% highlight html %}
<input type="checkbox" name="pager[user_ids][]" value="1">
<input type="checkbox" name="pager[user_ids][]" value="2">
<input type="checkbox" name="pager[user_ids][]" value="3">
{% endhighlight %}

This way, the selected user IDs will get submitted as an array.

The next problem was **Strong Parameters**. Even though I added `permit(:user_ids)`, I got an Error message saying something aling "Parameter 'user_ids' not allowed.".

Digging in the [API from ActionController::Parameters](http://api.rubyonrails.org/classes/ActionController/Parameters.html) I discovered that only some scalar types are allowed. To allow Arrays, they have to be declared as such:

{% highlight ruby %}
def pager_params
  params.reqire(:pager).permit(user_ids: [])
end
{% endhighlight %}

If you're new to Strong Parameters, I highly recommend reading [Strong Parameters by Example](http://blog.sensible.io/2013/08/17/strong-parameters-by-example.html) by sensible.io.

