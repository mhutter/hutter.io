---
layout: post
title: 'NPM install yields "Error: SSL Error: SELF_SIGNED_CERT_IN_CHAIN"'
tags: [nodejs, npm]
---
**Problem**

    user@host:~ $ npm install coffee-script
    npm http GET https://registry.npmjs.org/coffee-script
    
    npm ERR! Error: SSL Error: SELF_SIGNED_CERT_IN_CHAIN
    npm ERR!     at ClientRequest.<anonymous> (.../lib/node_modules/npm/node_modules/request/main.js:483:26)
    npm ERR!     at ClientRequest.g (events.js:156:14)
    npm ERR!     at ClientRequest.emit (events.js:67:17)
    npm ERR!     at HTTPParser.parserOnIncomingClient [as onIncoming] (http.js:1256:7)
    npm ERR!     at HTTPParser.parserOnHeadersComplete [as onHeadersComplete] (http.js:91:29)
    npm ERR!     at CleartextStream.socketOnData [as ondata] (http.js:1288:20)
    npm ERR!     at CleartextStream._push (tls.js:375:27)
    npm ERR!     at SecurePair.cycle (tls.js:734:20)
    npm ERR!     at EncryptedStream.write (tls.js:130:13)
    npm ERR!     at Socket.ondata (stream.js:38:26)
    npm ERR! You may report this log at:
    npm ERR!     <http://github.com/isaacs/npm/issues>
    npm ERR! or email it to:
    npm ERR!     <npm-@googlegroups.com>
    npm ERR!
    npm ERR! System Linux 2.6.32.29-0.3-default
    npm ERR! command "node" ".../bin/npm" "install" "coffee-script"
    npm ERR! cwd /home/user
    npm ERR! node -v v0.6.18
    npm ERR! npm -v 1.1.21
    npm ERR! message SSL Error: SELF_SIGNED_CERT_IN_CHAIN
    npm ERR!
    npm ERR! Additional logging details can be found in:
    npm ERR!     /home/user/npm-debug.log
    npm not ok

**Solution**
{% highlight sh %}user@host:~ $ npm config set strict-ssl false{% endhighlight %}
or
{% highlight sh %}user@host:~ $ npm config set registry="http://registry.npmjs.org/"
{% endhighlight %}