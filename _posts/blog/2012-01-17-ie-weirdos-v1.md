---
layout: post
category: post
title: IE weirdos v1
comments: true
tags:
  - js
---

As usual when working in a project, the moment to face IE comes, and it always comes with new and weirder surprises.

Compatibility mode is usually the first thing to fuck your page up. I always use the strategy to start from newer to older, just because i get fewer errors. Then fix that stuff, and move on into the older versions one at a time.

So this time, after including html5shiv because IE8 and brothers don't know what <section> or <header> elements are (and since it doesn't know, it just wont let you manipulate it with javascript) ...

    Unexpected call to method or property access.

... I found one of these surprises that we like from microsoft.

So, I was getting this error from the IE console:

    Object doesn't support this action

Looking at the code then you see this:

    defaults: {
        case: null,
        legal: null
    }

... What the fuck is going on ...

... could it be ... no, no, it can't be that stupid ...

... Mmmh let's try ...

    defaults: {
        "case": null,
        legal: null
    }

Booom, error fixed. Stupid browser says that object does not support the case instruction ... Ahh for fuck sake, this is new.

So after this... you start seeing more like this but with other keywords, like:

The default switch instruction:

    defaults: {
        'default': {
            key: null,
            locarno: []
        },
        [...]
    }

Etc. I suppose that with the rest of words its the same.

Fuck IE, seriously, there is nothing worse than a browser/interpreter that makes you change how your code looks because it hasn't the grammar properly implemented... (that, and all the css quirks that it has, and the opposition to webgl, etc)

Bonus: Extra commas in object literals result in broken JS on IE, like this

    var a = {
        ie: 'sucks',
        aLot: 'fuckit',
    }

That extra comma will break all your scripts.

