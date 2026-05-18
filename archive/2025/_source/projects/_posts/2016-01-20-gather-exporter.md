---
layout: project
title: Gather exporter
tags:
  - javascript
  - react
  - web app
images:
  - thumbnail: '/img/projects/gather-exporter/1 small.png'
    url: '/img/projects/gather-exporter/1.png'
    title: Main page
  - thumbnail: '/img/projects/gather-exporter/2 small.png'
    url: '/img/projects/gather-exporter/2.png'
    title: Fetched collections
  - thumbnail: '/img/projects/gather-exporter/3 small.png'
    url: '/img/projects/gather-exporter/3.png'
    title: Zip file contents
---

Gather exporter allows you to export/backup the collections you have entered in
Wikipedia (English, Hebrew, etc) into a few different formats.

This web app built with React.js polls the Wikipedia API and downloads your
collections, showing them on a table.

If you want to download them, it'll give you the option to download a zip file
generated on the browser containing the data in different formats (JSON,
WikiText, YAML, HTML) so that you can have your lists backed up.

* [Github repo][repo]
* [Live version][live]

[repo]: https://github.com/joakin/gather-exporter
[live]: https://chimeces.com/gather-exporter
