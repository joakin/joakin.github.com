---
layout: project
title: Loot (PWA wikipedia)
tags:
  - javascript
  - react
  - web app
  - offline
images:
  - thumbnail: '/img/projects/loot/1 small.png'
    url: '/img/projects/loot/1.png'
    title: 'Wikipedia article'
---

Progressive web application version of Wikipedia mobile web.

Experimentation project trying to see how feasible it is to make Wikipedia
a progressive web app for a better UX and faster interactions on slow
connections.

Technologies used:

* React.js
* Redux
* React router
* Node.js
* Service Worker
* Webpack
* Less
* Universal/Isomorphic JS
  * Server rendered webapp
  * UI tests running in node
* Live reloading
* IDB/localstorage caching
* Docs (Gitbook)

It features a [transformation/aggregation server (loot)][loot] with caching
invalidation from the wikipedia API, and a server that renders the web
application ([loot-ui][]) (the same one that runs on the client).

Expanded docs are [available (docs)][docs].

At the moment, there is a live version at
[loot.wmflabs.org/wiki/Wikipedia][live].

The site works complete offline and it is installable on the phone's
homescreen. HTML only version fully supported.

See the [docs][] for more detailed information.

[loot-ui]: https://github.com/joakin/loot-ui
[loot]: https://github.com/joakin/loot
[docs]: http://chimeces.com/loot-ui/
[live]: https://loot.wmflabs.org/wiki/Wikipedia
