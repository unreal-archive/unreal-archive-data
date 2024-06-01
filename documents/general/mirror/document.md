# Archive Mirroring Guide

To ensure the longevity of the archive, you're encouraged to create your own 
local (or hosted, if needed) mirrors of both the archive content, and the 
website itself.

Both are supported by the Unreal Archive command line tooling.

## General Requirements

1. 7-Zip
   - for Linux, install package `p7zip-full` (Debian-based) or equivalent; this should add command `7z` to your path
   - for Windows, download and install an appropriate version from the [7-zip website](https://www.7-zip.org/download.html).
2. Download the Unreal Archive tools:
   - Linux binaries:
      - these binaries should require no dependencies, as the JRE is bundled 
      - for local content mirroring (downloads): [unreal-archive](https://code.shrimpworks.za.net/artefacts/org/unrealarchive/unreal-archive/latest/)
      - for creating a website mirror: [www](https://code.shrimpworks.za.net/artefacts/org/unrealarchive/www/latest/)
   - For Windows:
      - please clone the [Git repository](https://github.com/unreal-archive/unreal-archive) and follow the build instructions from the README to produce native Windows binaries. 
3. At least 2GB free RAM
   - The tool loads a lot of metadata, and uses a large amount of memory.

## Local Content Mirror

Before you begin, you will need the requirements listed above.

To create a local mirror of all content (maps, skins, mods, etc) within the
archive, run the `unreal-archive` tool with the following parameters:

**Linux terminal**
```
$ ./unreal-archive mirror local-mirror /local/mirror/output --concurrency=5
```

**Windows command prompt**
```
\> unreal-archive.bat local-mirror c:\local\mirror\output --concurrency=5
```

A temporary copy of the archive metadata will be downloaded and extracted,
loaded, and then begin downloading all the actual files to the specified
`/local/mirror/output` directory.

If you want to tune the concurrency, adjust the `--concurrency` option's
value. The default is 3.

The entire process will take a while, depending on the size of the content
repository, available bandwidth, etc., but once completed, you'll have a
complete local copy of everything the archive contains.

## Website Mirror

The option exists to create a complete mirror of the archive website, with the
intention that this can be easily re-generated and re-hosted at any point,
should the original website go down, or if you simply want to create an offline
copy of the website for your own use.

Before you begin, you will need the requirements listed above.

To create a local mirror of the website, run the Unreal Archive `www` tool with
the following parameters:

**Linux terminal**
```
$ ./www www /local/website/path --local-images=true --content-path=/path/to/unreal-archive-data
```

**Windows command prompt**
```
\> www.bat www C:\local\website\path --local-images=true 
```

This will generate a copy of the website, within the directory specified by
`/local/website/path`. The option `--local-images=true` will also download all
images needed by the website to the output directory, rather than linking to
them remotely.

You may then open the `index.html` file within the output directory to begin
browsing the site.

Features such as search will not be available locally.
