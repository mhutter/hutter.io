---
layout: post
title: Managing DNS records the DevOps way
tags: [dns, dnscontrol]
---

Managing DNS records has always been a bit of a hassle for me. Most DNS
providers have some sort of web gui where you have to manually fiddle in all
records manually. Besides the fact that this is really tedious, this is quite
error-prone. Humans are horrible at doing manual work! So let's automate this!

My first iteration was moving everything to AWS Route53. Amazon provides APIs
for all of their services, but unfortunately they are horribly complicated!

So in the next iteration I moved everything to Google Cloud. They also provides
APIs and they're much easier to use! You can build a DynDNS-like service in [a
couple of lines][1].

The third iteration was when I discovered [DnsControl][2]. It allows you to
define DNS records using a small DSL, and then push those changes to your DNS
providers using a small CLI tool.

In a nutshell, it works like this: You define your DNS zones and records in a
file called `dnsconfig.js`, provide credentials for your DNS provider, and then
run `dnsconfig push` to push those records to your Provider.

An example config could look like this:
```js
var REG_NONE = NewRegistrar('none', 'NONE')
var GCLOUD = NewDnsProvider('gcloud', 'GCLOUD')

D('example.com', REG_NONE, DnsProvider(DNS_BIND),
    A('@', '1.2.3.4'),
    A('test', '5.6.7.8')
);
```

See the [DnsControl Getting Started guide][6] for a more complete example.

I really like DnsControl for various reasons:

- It allows you to define DNS records as code, which means you can write scripts
    that automatically generate the required code (see [dnsconfig.sh][3] for an
    example)
- Having your config as code means you can [put it in Git][4]! I love putting
    stuff in Git because it makes it so forgiving to try out new stuff when you
    can easily recover the last working state with a couple of keystrokes.
- It works with [many different providers][5], which makes it easy to move from
    one to another. Not happy with Google anymore? Replace the provider in your
    `dnsconfig.js` and `dnscontrol push` - done! You can even push your zones to
    multiple providers at the same time if you want to be on the safe side.
- When pushing the records, DnsControl will remove any records not in
    `dnsconfig.js` anymore. This really helps with keeping your zones cleaned
    up!

And that's it! In the [next post][], I describe how to further automate our
setup and automatically deploy each change!

[1]: https://github.com/srueg/dynamic-cloud-dns
[2]: https://stackexchange.github.io/dnscontrol/
[3]: https://github.com/mhutter/infra-kubernetes/blob/a45ae424589d1cfb44314900f4565832389a7265/scripts/dnsconfig.sh
[4]: https://github.com/mhutter/dns
[5]: https://stackexchange.github.io/dnscontrol/provider-list
[6]: https://stackexchange.github.io/dnscontrol/getting-started
[next post]: {{ site.baseurl }}{% post_url 2018-04-20-continuously-deploying-dns-records-with-dnscontrol-and-circleci %}
