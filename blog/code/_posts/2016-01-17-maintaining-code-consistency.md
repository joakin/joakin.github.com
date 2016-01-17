---
layout: post
title: Maintaining code style consistency
comments: true
tags:
  - code
---

When working with a team together on a code base, code style is something that
ends up being pretty important to agree on.

It doesn't matter if it is with or without semicolons, with or without spaces
everywhere, it is considered a good practice to settle on some set of rules,
and try to follow them.

Let's review current options in JS-land, talk about the setup, and see
a different take on code style that takes burden off developers.

## Linters and style checkers

Usually, what we do is set some kind of linter that the developers are supposed
to run manually every time they commit. These linters help not only with code
style issues, but with the quirks of the language, so it is pretty important to
run them often.

Some popular options are:

* [eslint][]: Super configurable, very well maintained
* [standard][]: Zero configuration, based off `eslint`
* [jscs][]: Extremely configurable style checker
* [js-beautify][]: Older tool, available in several languages

There are a lot more, like [jshint][] for example, and as usual in JS-land, the
myriad of options and tooling are overwhelming.

### Recommendations

I personally use [standard][] for my personal projects because of its lack of
configuration and ease of set up, as well as being able to format your code and
fix mistakes automatically.

For bigger projects I would suggest using [eslint][] because of how well
maintained it is and how well it supports es2015+ syntax.

## Workflow

### Running the linter

When using these linters / style checkers, it is usually a good idea to add
a npm script for linting the code:

    "scripts": {
      "lint": "standard"
    }

This way, everybody uses the same way of linting the code.

### Linting before committing

Another option to make this more automatic is to add a `pre-commit` or
`pre-push` hook to run the linter before committing/pushing. Edit
`.git/hooks/pre-commit` and add `npm run lint` for linting the project before
committing (and aborting the commit if there are lint errors).

A couple of cons of this approach are:

* Need some script to automate the creation of the `pre-commit` hook (otherwise
  it is just tedious to set up for developers)
* Aborting the commit is very annoying, especially with a long list of style
  nitpicks (context loss)

### Linting while programming. Editor integration

A good approach is to have people integrate their editor with the linters, so
that it shows errors inline. This keeps the developer focus when programming,
fixing the errors as we create the program.

For example, for vim you can use [syntastic][], which will run the linters on
save and show you in the code the errors. With syntastic, if you add
`./node_modules/bin/` to your path, it should autodetect the linter installed
and run them for you.

Most editors have the capability of linting the code on the code editing view,
it is really useful.

## A different take. Automatic style formatting

All the previous approaches are fine, but they take development time and the
developer's attention when they could be doing something useful instead of
fighting a linter to add spaces between brackets, or moving var declarations at
the top of a function.

### Linters that can format your code

If you have to choose a linter, choose one that has the capability of
formatting the code following whatever rules defined. As far as I know,
[eslint][], [standard][] and [js-beautify][] have this feature.

That way, you can run whatever command your linter has for formatting the code,
and get most of the warnings on the code fixed for you without having to worry
about fixing whitespace or code style manually.

For example, with [standard][] you can run `standard -F` and it will format the
files trying to make the linter happier.

### Automatically format code on `git add`

One approach that I investigated was automatically formatting the code when
adding it to the repo. This (in my opinion) keeps the burden to the minimum,
and makes sure that the code that goes into the repo is always properly
formatted.

For this, we would use a little unknown feature called [git attributes][].

By setting up a `.gitattributes` in your repo like this:

    *.js filter=jsbeautify

We'll tell git to run the specified filter when adding things to the repo. This
way, when adding a file to the staging area, the file will be passed through
the specified filter (in this example `jsbeautify`, which we'll define soon)
and the output will be what will be shown in diffs and added to the repo.

This filter (in this example `jsbeautify`) needs to be defined in the repo's
configuration. *I haven't found a way to add it as a file in the repo yet, the
repo's config gets saved in `.git/config`*.

For defining the filter we need to provide a `clean` and `smudge` config, like
this:

    git config --local filter.jsbeautify.clean "js-beautify -f -"
    git config --local filter.jsbeautify.smudge cat

We can automate by having a script that runs these commands.

One *con* for this approach is setting up the config every time somebody clones
the repo. Still, very interesting to consider for teams really involved in
having a consistent and enforced code style.

## Links
* Patch where I implemented this for a mediawiki extension: [gerrit.wikimedia.org/r/#/c/173026][grrit]




[eslint]: http://eslint.org/
[standard]: http://standardjs.com/
[js-beautify]: https://www.npmjs.com/package/js-beautify
[jscs]: http://jscs.info/
[jshint]: http://jshint.com/
[syntastic]: https://github.com/scrooloose/syntastic
[git attributes]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes
[grrit]: https://gerrit.wikimedia.org/r/#/c/173026/
