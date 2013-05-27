---
layout: post
category: post
title: Developing comfortably on windows
comments: true
tags:
  - setup
  - programming
---

Since almost 3 years ago I have been working mostly in Windows as a web
developer, because of the constraints of a corporate environment. First Windows
XP, then Windows 7, both equally closed and restricted, without admin
privileges, with a propietary NtlmV2 proxy on the way to the net, etc.

Through all this time, bit by bit I learned new tricks, applications, etc, that
as a developer made feel at home (unix) and be more productive. In here I will
provide the tricks I used and the applications I have installed at the moment
of leaving, commenting their utility and *why*.

### Main system advice. Installing programs

In our environment we had two drives on each machine. `C:` was used for the
operating system and corporate programs, and `D:` was used as the other
"*free*" drive. Under `D:` I had permissions to _fully write_, and the evil
**McAffee** wouldn't possess the cpu and hard drive each time the disk was
touched.

So, with time, the advice when trying to get a program working was:

1. Try installer normally
2. Through installer, look for "*Options*", "*Personalize*" or similar.
3. If there was the option, change install dir to `*D:\bin*`.
4. If I was able to choose what would be installed, uncheck all unnecessary
   items that may cause problems. For example *Add to PATH* or *Add shortcuts
   to Start Menu and Desktop*, etc. Look out for these things.
5. No luck, then go search for a portable version.

So without more delays, these are the programs and utilities that solve
different needs a programmer can have.

### System wide

#### Cntlm. Avoiding the NTLMv2 proxy as much as possible.

If you are under a win proxy, chances are that many programs do not know how to
talk that propietary protocol, so you won't be able to use networking with
them. For example, `npm` with node, `gem` with ruby, and lots more.

Using [Cntlm][] is one of the best things I did on the computer. When
configured properly, it acts as a normal proxy and redirects everything to the
corporate proxy filling in auth and NTLMv2 info.

At the beginning I was using fiddler2 but cntlm is much better and transparent.

After configuring it create a shortcut to cntlm.exe on:

`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

And then, right click it, and on the target input set it to start with your
config file:

`D:\devel\bin\cntlm\cntlm.exe -c D:\devel\bin\cntlm\cntlm.ini`

To fill the .ini file, look at these links or use your *search-fu*:
* [My example cntlm.ini config based on my real one working][Cntlm ini file]
* [How to fill proxy information in cntlm config file][Cntlm sample]

#### Text Editor Anywhere. Open your preferred text editor to edit text anywhere.

I am a fan of my editor. I have it customized and it suits my editing needs
perfectly. So, when I am anywhere else, if I intend to do some serious editing
I want to use it.

For this requirement, [Text Editor Anywhere][] is a god send. I have it mapped
to Win+A, and wherever I am, Outlook, Firefox, Chrome, Notepad, I can press it
and I get my editor open and pre-filled. When I'm finished, just save and close
and the text gets updated from where it came from. Simple and excellent.

#### Flux

For those short winter days where daylight disappears soon, [Flux][] makes your
monitor light differently through the day, making it easier on the eyes after
long hours.

#### AutoHotkey

[AutoHotkey][] is the **holy grail** of windows customization and automation.
It is a runtime with a scripting language with which you can do almost
anything.  Paraphrasing from their site:

    > Fast scriptable desktop automation with hotkeys

It is not only what you can do, but what everybody else has already done. It is
great and you need it.

I have used it to remap some keys, change mouse behaviour, etc. Here go
a couple of links to get started. Next item is my custom autohotkey script, so
go look at that also.

* [Remapping Keys and Buttons][AutoHotkey Remap]
* [Tutorial and Overview][AutoHotkey Tut]

#### Custom user AutoHotkey script

I've got one custom script that I execute on startup that does a couple of
things:

* Remap Capslock to something more useful (Ctrl)
* Reverse scroll to work like in OSX

Looking at the documentation on the previous item, you will be able to do these
things, and a million more.

* [Capslock and reverse scroll custom ahk script][AutoHotkey Script]

#### WindowPad

WindowPad is a great substitute of the poor 

[WindowPad][]
[WindowPadX][]

#### Snipping Tool

[Snipping Tool][]

#### Custom Fonts (regfont)

[Custom Fonts (regfont)][regfont]

```cmd
D:\devel\bin\regfont.exe -a D:\devel\fonts\*
```

[Font problem][font-install-problem]
[Font problem 2][font-install-problem-2]


### Applications

#### Dropbox

[Dropbox][]
[Dropbox portable][]

#### Calibre Portable

[Calibre Portable][]

#### Pidgin

[Pidgin][]

#### Launchy

[Launchy][]

#### FocusWriter

[FocusWriter][]

#### Pencil Project

[Pencil Project][]

#### RestClient

[RestClient][]

#### Xampp

[Xampp][]

#### Node

[Node][]

[Node downloadsd][node-downloads] Windows Binary (.exe)

[Node portable 0.10.8 by imsky.co][node-portable]

#### Php


#### Python

[Python][]
[Portable python][portable-python]

#### Chrome

[Chrome][]

#### Firefox Portable

[Firefox Portable][]
[Aurora][]

#### Vim

[Vim][]

#### Emacs

[Emacs][]

#### LightTable

[LightTable][]

#### Console2

[Console2][]

#### Msysgit (or cygwin). POSIX shell on windows (bash)

[msysgit][]
[cygwin][]

#### Git

[Git][]

#### Ack

[Ack][]

#### Ctags

[Ctags][]

[Cntlm]: http://cntlm.sourceforge.net/
[Cntlm sample]: http://stackoverflow.com/questions/9181637/how-to-fill-proxy-information-in-cntlm-config-file
[Cntlm ini file]: https://gist.github.com/joakin/5656471
[Text Editor Anywhere]: http://www.listary.com/text-editor-anywhere
[Flux]: http://stereopsis.com/flux/
[AutoHotkey]: http://www.autohotkey.com/
[AutoHotkey Remap]: http://www.autohotkey.com/docs/misc/Remap.htm
[AutoHotkey Tut]: http://www.autohotkey.com/docs/Tutorial.htm
[AutoHotkey Script]: https://gist.github.com/joakin/5656110
[WindowPad]: http://www.autohotkey.com/board/topic/19990-windowpad-window-moving-tool/
[WindowPadX]: http://hoppfrosch.github.io/WindowPadX/files/WindowPadX-ahk.html
[Snipping Tool]: http://windows.microsoft.com/en-sg/windows7/products/features/snipping-tool
[regfont]: http://www.marshwiggle.net/regfont/
[font-install-problem]: http://tsukasa.jidder.de/blog/2008/04/18/temporarily-register-fonts-using-a-normal-user-account
[font-install-problem-2]: http://www.dailygyan.com/2008/05/how-to-install-fonts-in-windows-without.html
[Dropbox]: https://www.dropbox.com/
[Dropbox portable]: http://nionsoftware.com/dbpahk/
[Calibre Portable]: http://calibre-ebook.com/download_portable
[Pidgin]: http://www.pidgin.im/
[Launchy]: http://www.launchy.net/
[FocusWriter]: http://gottcode.org/focuswriter/
[Pencil Project]: http://pencil.evolus.vn/
[RestClient]: https://code.google.com/p/rest-client/
[Xampp]: http://www.apachefriends.org/en/xampp.html
[Node]: http://nodejs.org/
[node-downloads]: http://nodejs.org/download/
[node-portable]: http://imsky.co/downloads
[Python]: http://www.python.org/
[portable-python]: http://www.portablepython.com/
[Chrome]: http://google.com/chrome
[Postman]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en
[Firefox Portable]: http://portableapps.com/apps/internet/firefox_portable
[Aurora]: http://www.mozilla.org/en-US/firefox/aurora/
[Vim]: http://www.vim.org/
[Emacs]: http://www.gnu.org/software/emacs/
[LightTable]: http://www.lighttable.com/
[Console2]: http://sourceforge.net/projects/console/
[msysgit]: http://msysgit.github.io/
[cygwin]: http://www.cygwin.com/
[Git]: http://msysgit.github.io/
[Ack]: http://beyondgrep.com/
[Ctags]: http://ctags.sourceforge.net/
