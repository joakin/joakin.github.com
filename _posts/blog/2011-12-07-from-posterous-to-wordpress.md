---
layout: post
category: post
title: From posterous to wordpress
comments: true
tags:
  - System administration
---

I have just moved from my posterous blog into a self hosted solution (wordpress).

### Why move ###

Moving out of posterous was a no-brainer, specially since they changed into posterous spaces. Everything became so social, with facebook/google+/tumblr smell that it no longer is a blogging platform I can consider using.

It still has its uses, and of course its public, but it's just not for me.

### Bad things about posterous ###

It is slow. Or at least I perceive it as slow.

Management is horrible. Blogs management is horrible. The whole backend it's an ajax application that is really bloated. It's the page that most times has crashed google chrome for me.

It has poor customization. The job with the themes is very good (but the editor makes you want to kill yourself slowly and painfully) but you cannot use javascript on them. It's understandable because of the security risks, but if you need to touch stuff then you can't. It also lacks plugins, so you get the standard blog format without the ability to customize it with plugins and addons. If you want a half serious writing platform, you need something more customizable.

Added stuff on the blog theme. Since it is a hosted solution, they promote the usage of their application by putting some things into your page, even if you don't want to, like the navigation bar or the bottom-of-the-page bar.

### Good things about posterous ###

Its hosted. That means no sysadmin stuff, everything is installed, no maintenance, etc. It makes it easy, and straight to the point, writing.

Themes. It has several quality themes (aesthetically pleasing) and it gives you the ability to modify completely the theme file, so html, css, and posterous theme structures are completely customizable if you want to.

Email posting. By default, and what they promoted as one of their key features in the past, posterous enables you to post to your blog via email, which means that you can compose wherever you are, and keep drafts in the email and whenever you are ready you just send it and bam! published. It makes publishing easy and encourages writing.

### New platform: wordpress ###

As a solution for blogging I was researching and after seeing several publishing platforms I finally settled for wordpress. The reasons are clear, even hating php.

It is a established player with a great product. It is solid, maintained by a profitable company, open source and easy to use. There are tons of documentation available on the net.

It has tons of plugins for whatever you want, it has importers from lots of places and exporters so that if you ever want to get your data away you can.

Millions of themes (even if I use the default). If you want a beautiful theme there are free available, cheap good ones, or wonderful premium. You also get tons of resources just in case you want to create your own.

There probably are lots of stuff that I don't even know, but I know that they are there, and if some day I need to add stuff or handle special cases chances are that somebody already did it successfully and shared it.

### Migration ###

Posterous doesn't provide a exporter that I can use directly on wordpress, and there are several solutions available, but right now I can't get any of them to work.

The first one was using the posterous importer plugin to fetch the data, but that didn't work. It looks like the plugin is no longer maintained, so it's outdated.

The other one was creating a blog in [wordpress.com][] and using their posterous importer, and then export that blog into wordpress rss format and import it on this one.
This didn't work either because the posts never got imported into wordpress.com . Maybe I did something wrong, maybe it is because that blog is private, who knows, I will keep trying.

### Plugins ###

Mandatory plugins I found are:

[WordPress super cache][wpsp]
Keeps a cache of your site, so that it can handle visits better

[Google analytics for wordpress][gaw]
What it says. Besides from importing your code, it adds interesting variables to the google analytics custom variables that you can see later. Like visits per category or tag, for example.

### Technology ###

The stack is a simple LAMP on a [linode][], and the domain was bought at [namecheap][]

For installing and configuring the lamp, wordpress and the domain records, I followed the [documentation from the linode library][linodedocs]. It is pretty good.

That's it for now, it has been quite easy until the moment to get going.

[wordpress.com]: http://wordpress.com/
[wpsp]: http://wordpress.org/extend/plugins/wp-super-cache/
[gaw]: http://wordpress.org/extend/plugins/google-analytics-for-wordpress/
[linode]: http://www.linode.com/
[namecheap]: http://namecheap.com/
[linodedocs]: http://library.linode.com/
