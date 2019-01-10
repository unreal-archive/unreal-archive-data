# Unreal Archive Contribution Guide

This document describes some of the ways you can help contributing code, 
features, fixes and updates to the Unreal Archive website generation and 
content indexing and management.

The Unreal Archive is a completely open source toolset, and as such, 
contributions and welcomed and encouraged.

To begin, fork and clone the [Git Repository](https://github.com/unreal-archive/unreal-archive).

After making changes, create a pull request from your fork to the repository
linked above. Please refer to [GitHub help](https://help.github.com/articles/proposing-changes-to-your-work-with-pull-requests/)
if you haven't done this before, it's really quite quick and easy once you get
to know the process.

Refer to the project's README document for development prerequisites.

## Quick Wins

### Category / Gametype Images

All category/gametype images are 1024 x 300 px `.png` images.

Images for categories on the home page are stored in:

`./resources/src/net/shrimpworks/unrea/archive/www/static/images/contents/`. 
These are then referenced by the `index.html` file located in the root of the 
`./resources/src/.../www` directory.

Images for gametypes are stored in the following path:

`./resources/src/net/shrimpworks/unrea/archive/www/static/images/gametypes`.
You'll see there's a directory for each game under there, and a `.png` image
file named after each gametype. The game directory and gametype image are named
exactly as they appear in the website, spaces and all.

To see the changes, you'll need to rebuild the website content on your PC, 
which can be done with the following commands in Bash or your favourite shell,
within the project root directory:

```bash
# rebuild builds the project
$ ant
# rebuild website
$ ./dist/unreal-archive www /path/to/output --content-path=./unreal-archive-data --store=NOP
```

You can then open `/path/to/output/index.html` in a browser to see the changes.

## Slightly More Interesting

### Website and CSS

If you'd like to suggest some changes or optimisations to the web page layouts
themselves, you'll find HTML templates located in 
`./resources/src/net/shrimpworks/unrea/archive/www/[content|docs|managed]/`.

These are [Freemarker](https://freemarker.apache.org/) templates, and are 
pretty much nothing but plain old HTML with some fancy template functionality
added on top. These templates compiled and used to build the website pages
when running the `www` command.

The website may also be restyled using the CSS located in the 
`./resources/src/.../www/static/css` directory. This is plain old CSS, and is 
not processed as LESS or SASS or anything else.

To test changes to output layout or styling, the website must be rebuild as 
per the command listing above.

## The Real Fun

### Indexing and Content Classification 

If you're familiar with Java, some of the more interesting work to be done is
in the content indexing process. You'll find all the code for content 
classification, data types, the indexing process and individual content type
metadata extraction within the `net.shrimpworks.unreal.archive.content` package
within the `src` directory.

There are certainly improvements which can be made to things like author 
or release date detection. Any improvements are welcome.

### Unreal Package Library

The content indexing process makes use of the 
[`unreal-package-lib`](https://github.com/shrimpza/unreal-package-lib) project
to inspect and extract the contents of Unreal Engine 1 and 2 packages.

There are still a couple of outstanding things which need doing (as of this 
writing, improve texture export for some texture formats, support for non-ASCII
strings, array properties), and contributions are welcomed. Improvements to
this library result in better quality indexing and metadata.

### Multi-platform Support

Currently the project has only been tested on Linux, the `unreal-archive` 
executable will work on Linux and Mac systems, though `unreal-archive-exec.jar`
should work on Windows, it's not cool to have to invoke it with
`java -jar unreal-archive-exec.jar <stuff>` - assuming this works on Windows
at all. 

### General Stuff

Any code improvements are welcome, even just change suggestions.
