---
layout: project
title: Do I have internet?
tags:
  - node.js
  - cli
images:
  - thumbnail: '/img/projects/doihaveinternet/1.png'
    url: '/img/projects/doihaveinternet/1.png'
    title: 'Readme'
  - thumbnail: '/img/projects/doihaveinternet/2.png'
    url: '/img/projects/doihaveinternet/2.png'
    title: 'Viz of data gathered'
---

I was suffering from a lot of internet micro-cuts so I made a simple tool to
keep track of the cuts to report to the SAT when they came along.

Turns out they have better & more reliable tools but I was afraid they would
ignore me so I had to gather evidence.

Here is the [npm package][npm] and the [code is on github][code].

I also made a [visualization of the data gathered for a few hours to understand
it better][demo] in the [canvas-playground][canvas-playground]
([source][viz-source]).

[npm]: https://www.npmjs.com/package/do-i-have-internet
[demo]: http://chimeces.com/canvas-playground/time-internet-down/
[code]: https://github.com/joakin/doihaveinternet
[canvas-playground]: http://chimeces.com/projects/2015/01/10/canvas-playground/
[viz-source]: https://github.com/joakin/canvas-playground/blob/master/lib/demos/time-internet-down/index.js
