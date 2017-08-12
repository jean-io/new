# New

New is a simple Linux command written in bash that allow you to create files with automatic template depending on extensions.

:kissing_smiling_eyes: Special thank to @Ayowel for his contributions.

## Usage

```
$ new filename1 filename2 filenam3
$ new filename -e c   # Create filename with the content of a .c file
$ new -m c,h filename # Create filename.h and filename.c
$ new --help          # Display the help
```

Available extensions are displayed [here](https://github.com/Ricain/new/tree/master/lib).

## Install

```
$ git clone https://github.com/Ricain/new
$ cd new
$ sh install.sh
```

## Liscence

MIT License
