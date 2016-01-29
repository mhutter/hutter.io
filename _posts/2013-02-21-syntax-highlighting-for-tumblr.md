---
layout: post
title: Syntax highlighting for Tumblr
tags: tumblr html css
---
1. Customize HTML for your theme, add this at the end of `<head>`{% highlight html %}
<link href="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.css" type="text/css" rel="stylesheet"/>
<script src="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.js" type="text/javascript"></script>
{% endhighlight %}

2. Add this to your Body-Tag: `onload="prettyPrint()"`

3. Done. To actually make use of it, you’ll have to use the HTML-Editor. I recommend the following (HTML5) convention:
{% highlight html %}<pre class="prettyprint"><code class="language-java">...</code></pre>{% endhighlight %}

**Recommended** Add this to your custom CSS:
{% highlight css %}
.prettyprint {
  overflow-x: auto;
}
{% endhighlight %}

If you want a transparent background, add this inside the curly braces: `background: none;`

**Optional** To use a [Theme](http://google-code-prettify.googlecode.com/svn/trunk/styles/index.html), download the desired CSS file (or create your own), [upload it to Tumblr](http://www.tumblr.com/themes/upload_static_file) and replace the default CSS file in step 1 (blabla…prettify.css) with the URL of your uploaded file. DONE!

(distilled from [/dev/null’s post on this topic](http://chmod755.tumblr.com/post/22916491981/syntax-highlighting-for-tumblr-posts))