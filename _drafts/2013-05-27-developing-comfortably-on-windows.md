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
of leaving, commenting their utility and *why* I've used them.

### First, some system advice. Installing programs.

In our restricted corporate environment we had two drives on each machine. `C:`
was used for the operating system and corporate programs, and `D:` was used as
the other "*free*" drive. Under `D:` I had permissions to _fully write_, and
the evil **McAffee** wouldn't possess the cpu and hard drive each time the disk
was touched.

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

### System wide programs

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

#### Flux. Change the tone of your screen depending on daylight.

For those short winter days where daylight disappears soon, [Flux][] makes your
monitor light differently through the day, making it easier on the eyes after
long hours.

#### AutoHotkey. Scriptable Windows.

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

#### WindowPad. What aero snap should have been.

[WindowPad][] is a great substitute of the poor aero snap. It is a window manager
on its own. It lets you move windows, resize them, change them of monitor,
maximize, etc, all with key shortcuts. It is a wonderful utility and it is
built on AutoHotkey, but it is delivered as a self contained executable.

There is also [WindowPadX][], a fork of WindowPad that is supposed to add some
good features. I haven't tried it myself, but looks promising.

#### Snipping Tool. Screenshots and annotations made easy.

The Windows [Snipping Tool][] is the default windows 7 screen shooting tool
(besides the Print Screen button). It actually is quite nice, and has enough
functionality for a day to day work.

I included it because it is a hidden gem that is useful and already available.

#### Custom fonts. Install fonts on a non-admin environment.

If you are anything like me, you like having fonts of your liking available to
customize how parts of the system work. The editor, browser defaults, and
system font, for example. The problem with not having administrator privileges
is that you cannot install fonts normally because they are located on
`C:\Windows\Fonts` and that is an administrator folder.

Luckily, normal users are able to install fonts using shortcuts that only last
through the user session. When the user logs out the fonts are erased.

By using a program like [regfont][], and adding it to startup, we can have the
fonts installed every time we log in. It only takes a few seconds.

So save regfont somewhere, like in `D:\devel\bin\regfont.exe`, then create
a shortcut, and place it on the startup folder.

`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

And then, right click it, and on the target field set it so that regfont loads
them from where you are putting your custom fonts:

`D:\devel\bin\regfont.exe -a D:\devel\fonts\*`

Ref links:
* [Font problem][font-install-problem]
* [Font problem 2][font-install-problem-2]


### Applications

#### Dropbox. Seamless storage in sync.

This online storage solution needs no presentation. Seamless cloud file sync
that allow you to share stuff between your home computer and the work one.

I managed to get the [Dropbox][] installer working but I know some partners
that had to use the officially supported and very updated [Dropbox portable][].

#### Calibre Portable. Book and document organiser and reader.

Calibre is a book manager that works greatly. It has also an ebook reader,
which is what I used it for. Besides that, you can use it for sorting a library
of work related pdfs and documents.

I had to install [Calibre Portable][], not the normal version.

#### Pidgin. Instant messaging multi-protocol client.

[Pidgin][] is an open source IM client. It allows you to connect to multiple
chat services, and works great.

#### Launchy. Open applications and folders fast and easy.

[Launchy][] is an application launcher, very useful if you have to move a lot
through folders or open different applications all the time.

#### FocusWriter. Distraction free writing.

[FocusWriter][] is a minimalistic writing environment worth checking out. No
fancy bells, just writing. The full screen mode is worth it.

#### Pencil Project. Mockups, prototypes and diagrams.

[Pencil Project][] is an open source tool based on firefox's xul runner. It is
a very interesting prototyping tool, cross platform, and worth checking out.

### Web development tools

#### RestClient. Test and call web urls (curl like)

[RestClient][] is a java app that comes in handy when you have to test some
webservices and do not have a web page set up. It works, but it is far from
pretty. With time I substituted it with things like [Chrome's Postman
extension][chrome-postman] or [Firefox's Rest Client
extension][ff-rest-client], which comply as well and are prettier and do not
depend on java.

#### Xampp. Server, database and web language on one package.

[Xampp][] provides an easy way of setting up an Apache, MySql, Php stack. For
example I have the apache document root pointing to my projects folder and
opened at startup, so that at anytime I can open any file/site of the folder in
the browser.

#### Node. JS on the server, scripting and web dev tools.

[Node][] is a JS framework based on async that runs on V8 on the server. It
also serves as a platform to lots of useful tools for web development, like css
and js minifiers, less/stylus compilers, jslint/jshint, uglifyjs, coffeescript
compiler, etc.

On it's ecosystem lots of useful tools for web development and it has been
really useful to have node and npm installed to make use of this tools.

To install it, I had to find a portable version the first time, from something
like [Node portable 0.10.8 by imsky.co][node-portable], save it on my paths,
and then, from there on, I updated the node binary from the official node site,
going to [Node downloads][node-downloads] and downloading the **Windows Binary
(.exe)**.

#### Chrome. Great browser and greater dev tools.

Google [Chrome][] is a fantastic browser that installs perfectly on corporate
restricted environments, and has been tremendously useful. It's devtools are
great, and it is a very good browser.

#### Firefox Portable. Great browser, untied from the corporate version.

At work we had a Firefox installed, but it was the ESR (Enterprise Release)
version and it had the profile modified and settings blocked, besides bookmarks
and home page presets and nasty addons pre-installed.

At the beginning I moved to using [Aurora][], a more experimental release of
firefox, but very stable, but the enterprise firefox updates would screw with
my profile.

To use the excellent and free Firefox and keep my profile with my stuff and
without the company's stuff I had to search for the [Firefox Portable][]
version, which works seamlessly.

### Programming tools

#### Vim. Amazing text editing.

[Vim][] is a open source modal editor that enables you to edit text
efficiently. It is my editor of choice and works perfectly on windows.

#### Emacs. Great text editor.

[Emacs][] is also an open source editor that is very extensible. It is very
good as well. Emacs and Vim are both old players on the text editing arena and
really good programs.

#### LightTable. Live coding for programming.

[LightTable][] is a new editor that puts an emphasis on live programing and on
the future on extensibility (not yet). Even it being 0.4 right now, it works
really well and has helped me to do some tasks.

#### Console2. What cmd.exe should be.

[Console2][] is a great cmd replacement that enables you to have profiles for
shells (so that you can have both shells of bash and shells of DOS and
PowerShell under the same window) and it also features lots of goodies like
configurability, tabs, transparent background, etc.

Great program, I could not have lived without it.

#### Msysgit (or cygwin). POSIX shell on windows (bash)

If you come from some linux/unix, for sure you are going to miss a good bash.
It is possible to have a good capable shell on windows, that will work for lots
of the cases and make your life easier.

That I know, there are two options:

* [msysgit][]
* [cygwin][]

Msysgit is the shell that gets installed when you install git from the
installer. That is the one I have used, and I haven't missed much.

Cygwin is another one that is more complete than the git one, but I haven't
tried it. I think it has a bigger community and a lot more packages available.

Anyway, choose what you want, it is a great tool to have.

#### Git. Versatile version control system.

[Git][] is a distributed version control system. I used it for the projects and
to keep my configuration files in sync. Essential.

#### Ack. Search through code fast and easy.

[Ack][] is a great search tool written in perl (provided by msysgit in my
case). It is my partner when navigating through code, works wonderfully and
fast.

I have integrated with Vim, so I can use it within my editor or in the shell.

#### Ctags. Code navigation.

[Ctags][] is a tool that generates tag files from code. Tag files are files
that your editor can interpret to show you completions when coding and to help
you navigate code.

It is very useful and every editor has some plug-in or support for tag files.

#### Python. Scripting on your computer.

I dabbled into [Python][] through its fantastic docs to do some scripting and
automate tasks on my computer. Python is a great language really pleasant to
use. When I installed it there was no portable version and it was a bit of
a hell to get it to install, but it seems like they have updated ones at
[Portable python][portable-python] now.




### Closing up

It is a long list and it was compiled through time. You should not try to
install all of them, but go one by one and give your self some days to get used
to the new tools.

It is never going to be as our beloved linux/osx, but it can be quite good if
you invest some time in getting the appropriate tools and on improving your
workflow.

If you see anything to correct or you have more suggestions about useful tools
for windows developers, please leave a comment.

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
[chrome-postman]: https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm
[ff-rest-client]: https://addons.mozilla.org/en-us/firefox/addon/restclient/
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

