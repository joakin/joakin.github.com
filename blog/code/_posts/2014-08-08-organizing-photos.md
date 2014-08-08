---
layout: post
title: Organizing photos with bash
comments: true
tags:
  - code
  - bash
  - photos
---

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


```sh
$ find */*/* -type d | xargs -n1  sh -c 'echo mv ${0}/* "$( dirname ${0})" ";" rm -rv ${0} '
```

