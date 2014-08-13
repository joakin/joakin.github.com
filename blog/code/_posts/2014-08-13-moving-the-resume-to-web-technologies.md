---
layout: post
title: Moving the resume to the web
comments: true
tags:
  - code
  - web
  - node
---

I've been having trouble with my resume editing for a long time. A long time
ago it was a word document, afterwards it became a odt document and migrated to
libreoffice/openoffice, and later I redid the resume using the europass
template provided by the european union following a standard format (also in
odt).

The problems I've found are:

* **Editing difficulties**. The template is made out of hundreds of tables, and
  with the libreoffice gui it is almost impossible for me now to even add new
  work experience. This is the most annoying of all.
* **Undistinguishable style**. The company I redid the resume wanted them all
  in the same format, but usually companies get resumes in different formats
  and using this template makes you indistinguishable of lots of other CVs they
  may get.
* **No versioning**. The file is stored in online backups but there is no
  comprehensive history like the one we could get with version control.
* **No web publishing**. You could export the file to html but it would be
  a horrible markup (and I usually apply for web dev skills..., what kind of
  dev would I be?). Your most reliable format to export is PDF, and I want to
  be able to put the resume on the web and link to it.

### A new resume

So after thinking about these problems, I set a few objectives and re-did the
cv:

* Open source
* Version control (git, GitHub)
* Separate content, markup and style
* Plain text format for the content (chose YAML because its readability)
* Readability, ease of editing, exporting formats and publishing


### [Github - joakin/resume](http://github.com/joakin/resume)

I'm using node.js and npm, I set up the project to execute via npm scripts, as
you can see in the readme. After setup, it becomes super easy to run both the
development flow (`npm run watch`) and to just run a build (`npm run build`).

```
├── README.md     # What is this and instructions
│
├── bin           # A couple of scripts to generate the html and pdf
├── package.json  # Package configuration, run scripts and deps
│
├── layout.jade   # Jade page layout (html, head, footer)
├── resume.jade   # Jade template that processes the yaml to html
│
├── resume.styl   # CSS styles (stylus preprocessor)
│
├── resume.yaml   # Resume data (pure content, yaml and blocks of
│                 # text with markdown
│
├── node_modules  # Deps of the proj (npm install)
│
└── static        # Where the the static web files and pdf are generated
    │
    ├── img/      # Imgs for the cv
    ├── fonts/    # Web fonts
    └── ...       # Generated files
```

Have a look at the files, I think the result is very satisfactory, readable and
very flexible.

#### The content

The content of the resume is kept in a YAML file, which I found very pleasing
and readable.

```yaml

fullName: Joaquin Oltra Hernandez
photo: photo.jpg
phone: (0034) 600078947
email: joaquin@chimeces.com
nationality: Spain
birthDate: 17-12-85

field: Software developer, Javascript programmer, Web developer

intro: |
  I'm a programmer and web developer specialized in JS who enjoys reading
  technical books, developing random playful side projects and learning and
  ...

work:
  - employer: Freelance (Various)
    when: December 2013 - Now
    position: Freelance web developer, Javascript programmer, HTML & CSS programmer
    what: |
      Freelance contracting for different clients.

      * Data visualizations dashboard with d3
      * JS web applications
        * React.js for the view layer
        * Browser applications using npm & browserify
      [...]


  - employer: OHIM
    when: September 2010 - June 2013
    position: Freelance web developer, Javascript programmer, Senior analyst programmer
    what: |
      While freelance contracting for OHIM, I went mainly through two different
      big projects, OHIM eSearch (JS web application) and the new OHIM Website
      (public site and suite of web tools).

      ##### eSearch

      Search engine for OHIM, I was involved in creating the single page
      application using Javascript, CSS3 with LESS, Backbone. This application
      [...]
```

Content is translated in the build step to json and then fed into the jade
templates. You can see it in
[`static/resume.json`](https://github.com/joakin/resume/blob/master/static/resume.json).

Also, the text blocks (using the `|` pipe) are later translated in jade into
markdown, so that we can get rich text when writing bigger blocks of text.

### Templates

I'm using HTML/CSS as the base from which to export to other formats like PDF.
For the markup and style I set up jade templates (simple and readable) and the
stylus css preprocessor. Here is a little example

```jade

extends ./layout.jade

block content
  header.main
    h1= fullName
    img.photo(src=photo)

  section.personal-information
    header: h2 Personal information
    article

      .kv.full-name
        label Full name
        span= fullName
      .kv.phone
        label Phone
        span= phone
      .kv.email
        label Email
        span= email
      .kv.nationality
        label Nationality
        span= nationality

      - var date = (new Date()).getFullYear() - 1985
      .kv.age
        label Age
        span= date
[...]
```

```stylus
@import "nib"
@import "stylus-normalize/normalize"

text-color = #333
light-text-color = #aaa
light-bg = #ddd

ul
  list-style-position inside

body
  color text-color
  font-family Latin Modern Roman, serif

h1, h2, h3, h4, h5, h6
  margin 0

body>header
  background-color light-bg
  color white
  text-align center
  h1
    margin 0
    padding 10px
[...]
```

I've tried to keep the html as semantic as possible, and in the styles I've
played with flex box to learn how it worked.

You can check the web published version at [chimeces.com/resume](http://chimeces.com/resume)

### Exporting to pdf

PDF generation is made via phantomJS, and thanks to npm and the amount of
libraries it was easy to find one that did what I wanted.

You can check the pdf published version at
[chimeces.com/resume/resume.pdf](http://chimeces.com/resume/resume.pdf)

### Development story

Another cool thing is that the development server autobuilds the web and pdf
when any of the files is changed and also has livereload so that the browser
autoupdates. All this is set up in the `package.json` in the scripts field
using the dependencies specified in `devDependencies`.

```json
  "scripts": {
    "serve": "./node_modules/.bin/livereloadx -s ./static/",

    "watch-stylus": "./node_modules/.bin/stylus -w resume.styl --out static -I ./node_modules",
    "build-stylus": "./node_modules/.bin/stylus resume.styl --out static -I ./node_modules",

    "watch-html": "./node_modules/.bin/watch-run -p \"*.+(jade|yaml)\" ./bin/build-html.js",
    "build-html": "./bin/build-html.js",

    "watch-pdf": "./node_modules/.bin/watch-run -p \"static/*.!(pdf|json)\" ./bin/build-pdf.js",
    "build-pdf": "./bin/build-pdf.js",

    "watch": "npm run watch-html & npm run watch-pdf & npm run watch-stylus & npm run serve",
    "build": "npm run build-html & npm run build-stylus & npm run build-pdf",

    "test": "echo \"Error: no test specified\" && exit 1"
  }
```

For **deployment** and publishing I use **github pages**, like in this blog, and simply
put in the repository the generated files and use a
[onliner script](https://github.com/joakin/dotfiles/blob/master/bin/gh-pages)
to publish (i think it needs git 2.X):

```sh
#!/bin/sh
if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages?"
  exit 1
fi
git subtree push --prefix $1 origin gh-pages
```

### The end

That's all for now, feel free to clone the repo, and make it yours changing
styles and yaml!

