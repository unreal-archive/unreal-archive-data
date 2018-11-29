# Archive Mirroring Guide

To ensure the longevity of the archive, you're encouraged to create your own 
local (or hosted, if needed) mirrors of both the archive content, and the 
website itself.

Both are supported by the `unreal-archive` tool.

> Note: As of this writing, the `unreal-archive` tool has only been tested on 
> Linux environments. Please refer to the project's README document for 
> information on running it on other platforms.

## Content Mirror

Before you begin, you will need the following:

1. Download the `unreal-archive` tool
2. Download or clone the `unreal-archive-data` git repository
3. Several hundred GB free disk space

To create a local mirror of all content (maps, skins, mods, etc) within the 
archive, run the `unreal-archive` tool with the following parameters:

```
$ ./unreal-archive mirror /local/mirror/output --content-path=/path/to/unreal-archive-data --concurrency=5
```

This will load all the content defined within the `unreal-archive-data` 
repository, and then begin downloading all the actual files to the specified 
`/local/mirror/output` directory.

If you want to attempt tuning the concurrency, adjust the `--concurrency` 
option's value. The default is 3.

The entire process will take a while, depending on the size of the content 
repository, available bandwidth, etc., but once completed, you'll have a 
complete local copy of everything the archive contains.

## Website Mirror

The option exists to create a complete mirror of the archive website, with the
intention that this can be easily re-generated and re-hosted at any point, 
should the original website go down, or if you simply want to create an offline
copy of the website for your own use.

Before you begin, you will need the following:

1. Download the `unreal-archive` tool
2. Download or clone the `unreal-archive-data` git repository
3. Several GB free disk space

To create a local mirror of the website, run the `unreal-archive` tool with the
following parameters:

```
$ ./unreal-archive www /local/website/path --local-images=true --content-path=/path/to/unreal-archive-data
```

This will generate a copy of the website, within the directory specified by 
`/local/website/path`. The option `--local-images=true` will also download all 
images needed by the website, to the output directory, rather than linking to 
them remotely.

You may then open the `index.html` file within the output directory to begin 
browsing the site.
