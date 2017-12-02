---
layout: project
title: Diving into ClojureScript
tags:
  - clojurescript
  - workshop
  - functional programming
images:
  - thumbnail: '/img/projects/diving-into-clojurescript/1-small.png'
    url: '/img/projects/diving-into-clojurescript/1.png'
    title: 'Diving into ClojureScript'
  - thumbnail: '/img/projects/diving-into-clojurescript/2-small.png'
    url: '/img/projects/diving-into-clojurescript/2.png'
    title: 'LightTable Exercises'
  - thumbnail: '/img/projects/diving-into-clojurescript/3-small.png'
    url: '/img/projects/diving-into-clojurescript/3.png'
    title: 'Canvas dynamic color wall'
  - thumbnail: '/img/projects/diving-into-clojurescript/4-small.png'
    url: '/img/projects/diving-into-clojurescript/4.png'
    title: 'LightTable plugins web application'
---

Diving into ClojureScript is a hands on workshop I gave at [FutureJS 2014
(Barcelona)][futurejs].

The workshop was aimed at javascript programmers who where novice in Clojure
and wanted to learn more about the language and about functional programming
and the advantages that the ClojureScript language provides when coding.

The materials are all interactive and the assistants worked on them through the
workshop using the [LightTable editor][lt], featuring live coding, interactive
development and thinking the functional way (data oriented).

The following materials supported the workshop:

### Slides

[Publicly available slides][slides] that guide through the workshop, with
a small introduction, guidance through the exercises, a vision over the
great features of the language, great libraries to keep in mind, info about
the testing story, and info about how the compiler works and the different
options.

### Code

All the code of the workshop is publicly available in [the github
repo][github]. It consists of three different sections:

1. [Basic exercises][exercises] - Introduction to the language and basics
1. [FutureJS wall][wall] - html5 canvas visualization
1. [LT plugins app][ltplugins] - Webapp for listing plugins via ajax

On the README of each folder there are instructions to follow to complete the
exercises (solutions are in the repo too).


[lt]:        http://lighttable.com/
[futurejs]:  http://www.futurejs.org/
[slides]:    http://slides.com/joakino/diving-into-clojurescript/
[github]:    https://github.com/joakin/diving-into-clojurescript-exercises/
[exercises]: https://github.com/joakin/diving-into-clojurescript-exercises/tree/master/basic
[wall]:      https://github.com/joakin/diving-into-clojurescript-exercises/tree/master/futurejs-wall
[ltplugins]: https://github.com/joakin/diving-into-clojurescript-exercises/tree/master/lt-plugins
