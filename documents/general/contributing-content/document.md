# Content Contribution Guide

The Unreal Archive currently consists of three main content types:

- **Game Content**: Automatically categorised and indexed user-created game content for Unreal, Unreal Tournament and Unreal Tournament 2004. 
- **Articles/Documents**: Help, guides, and reference articles for the games.
- **Managed Content**: Content or updates which cannot be automatically classified, for example patches or alternative renderers.

All of this content is defined within [YAML](https://en.wikipedia.org/wiki/YAML) files and stored within a dedicated Git repository at
https://github.com/unreal-archive/unreal-archive-data.

_**The process is currently somewhat technical**_, with no handy submission 
forms or rich text editors. The goal of the project is to create something 
easily (relative to many years of continued maintenance) maintainable and 
expandable, so the focus is currently on getting those underpinnings workable.
Any editors and uploaders are considered transitive and may change with the 
times, but should always be able to be applied on top of the base functionality
described here.  

> Note: As of this writing, the `unreal-archive` tool has only been tested on 
> Linux environments. Please refer to the project's README document for 
> information on running it on other platforms.

## Setup

You will probably need a local copy of the content repository, so begin by
forking and then cloning the 
[unreal-archive-data](https://github.com/unreal-archive/unreal-archive-data)
Git repository.


## Game Content

Adding new maps, map packs, skins, models and mutators requires a local,
packaged (zip, rar, 7z, umod, etc) copy of the content to be added, as well as
use of the `unreal-archive` command-line tool.

Before you begin, you will need the following:

1. Java 8 JRE
2. Download the `unreal-archive` tool
3. Clone the `unreal-archive-data` git repository



```
$ unreal-archive scan <path/to/something>
$ unreal-archive index </path/to/something>
$ unreal-archive edit <hash>
```

## Articles/Documents



## Managed Content



----

- TODO adding game content
- TODO adding written content/articles/documents
- TODO editing and fixing metadata
- TODO code changes