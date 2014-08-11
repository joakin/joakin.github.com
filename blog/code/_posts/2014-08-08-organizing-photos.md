---
layout: post
title: Organizing photos with bash
comments: true
tags:
  - code
  - bash
  - photos
---

I've been trying to organize my photos out of iPhoto and Shotwell into a common
file name format and into old trusty folders and files that I can backup and
check in services like Dropbox or Google Drive.

After exporting the library from iPhoto and Shotwell, and importing photos
I had in bare folders I had the task to get them organized consistently.

What I set up to get was a folder structure like this:

```
├── 2007
│   ├── Diario Informacion
│   ├── Examenes Septiembre
│   ├── Laysa
│   ├── Lolo
│   ├── Reuniones familiares
│   ├── Uni
│   └── Verano Garden
├── 2008
│   ├── Aachen
│   ├── Aachen visita Tapi Ana
│   ├── Aachen visita colegas
│   ├── Berlin
│   ├── Bonn
│   ├── Carnaval
│
...
```

Thats `YYYY/AlbumName/...`. For the name I wanted to rename the photos in
a common format to unify the different names that different cameras give to
photos. So the idea was to get the photo named `IMG_1000391.jpg` to become
`YYYYMMDD-HHSS-[Original name].jpg`.

After several tries and an incomplete program I did in node, I settled to
accomplish the task with the unix battletested tools we all love and hate.

### Renaming photos

So, for renaming the pictures, I did a little script that I would execute
inside my `iPhoto` or `Shotwell` picture, and go on renaming pictures based on
their exif data (date taken) as possible, using the awesome `jhead` command
line tool:

[organize-photos](https://github.com/joakin/dotfiles/blob/master/bin/organize-photos)
```sh
#!/bin/sh
if [ -z "$1" ]
then
  echo "Which folder do you want organize photos in?"
  exit 1
fi

IFS=$'\n\t'

for i in $(find $1 -type d)
do
  read -r -p "Do you want to organize $i? [y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
      jhead -autorot -n%Y%m%d-%H%M%S-%f $i/*
      ;;
    *)
      echo ""
      ;;
  esac
done
```

With that we get the pictures renamed with the data they were taken on (if that
does not exist or can't find it then it uses the created at date attribute on
the file). Also as a bonus, we tell `jhead` to autorotate the pictures based on
exif data.

### Organizing the folder structure to the one I wanted

After renaming the pictures, I had to deal with the folder structure of each
different program. iPhoto when it exports it puts the pictures in folders named
as the events you had in, like `Aachen, Bonn, Berlin, ...`.

For those, I just had to create the year folders and drop the event folders on
its corresponding year folder, easy.

For the Shotwell photos I had to move them from the created structure
`YYYY/MM/DD/photo.jpg` to `YYYY/MM/photo.jpg`. So using this small cli oneliner
I grouped the photos as expected.

```sh
$ find */*/* -type d | xargs -n1  sh -c 'echo mv ${0}/* "$( dirname ${0})" ";" rm -rv ${0} '
```

Executing this command should show the command line commands that would move
the photos, when you have verified that they should do what you want, just
append `| sh` after it and execute it again. Be careful and backup all your
photos before doing all this stuff.

```sh
$ find */*/* -type d | xargs -n1  sh -c 'echo mv ${0}/* "$( dirname ${0})" ";" rm -rv ${0} ' | sh
```

With that, I created some event folders and dropped the months in as expected.

Overall, pretty smooth experience, and a quick way to unify the photos
databases into a simple and trusty folder/file structure (28G of pics!).

The advantage is the ease of sync, and because the file names are organized as
the taken date, sorting by name in a folder will give you the files in taken
order so that you can make a quick presentation if you need to.

Some time in the future, I want to research how to go looking at the pictures
and marking the wants I don't want, to have them archived or deleted, and also
duplicate detection, since there are some folders that have thumbnails and
pictures which are the same.

