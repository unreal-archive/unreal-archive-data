# Archive Mirroring Guide

To ensure the longevity of the archive, you're encouraged to create your own 
local (or hosted, if needed) mirrors of both the archive content, and the 
website itself.

Both are supported by the `unreal-archive` tool.

## Website Mirror

The option exists to create a complete mirror of the archive website, with the
intention that this can be easily re-generated and re-hosted at any point,
should the original website go down, or if you simply want to create an offline
copy of the website for your own use.

Before you begin, you will need the following (see above for more detail):

1. Java 17 JRE
   - for Linux, install OpenJDK 17 JRE using your package manager
   - for windows, I would recommend [Azul's Zulu Community Edition JRE](https://www.azul.com/downloads/?version=java-17-lts&os=windows&architecture=x86-64-bit&package=jre#download-openjdk)
2. Download the `unreal-archive` tool
   - the latest can always be [downloaded here](https://code.shrimpworks.za.net/artefacts/unreal-archive/latest/)
   - on Linux, you may download the `unreal-archive` binary, and make it executable via `chmod +x unreal-archive`
   - for Windows, download `unreal-archive-exec.jar`
3. Several GB free disk space

To create a local mirror of the website, run the `unreal-archive` tool with the
following parameters:

**Linux terminal**
```
$ ./unreal-archive www /local/website/path --local-images=true --content-path=/path/to/unreal-archive-data
```

**Windows command prompt**
```
\> java -jar unreal-archive-exec.jar www C:\local\website\path --local-images=true 
```

This will generate a copy of the website, within the directory specified by
`/local/website/path`. The option `--local-images=true` will also download all
images needed by the website to the output directory, rather than linking to
them remotely.

You may then open the `index.html` file within the output directory to begin
browsing the site.

## Content Mirror

Before you begin, you will need the following:

1. Java 17 JRE
2. Download the `unreal-archive` tool
3. Several hundred GB free disk space and data transfer capacity

To create a local mirror of all content (maps, skins, mods, etc) within the 
archive, run the `unreal-archive` tool with the following parameters:

**Linux terminal**
```
$ ./unreal-archive mirror /local/mirror/output --concurrency=5
```

**Windows command prompt**
```
\> java -jar unreal-archive-exec.jar c:\local\mirror\output --concurrency=5
```

A temporary copy of the archive metadata will be downloaded and extracted,
loaded, and then begin downloading all the actual files to the specified 
`/local/mirror/output` directory.

If you want to tune the concurrency, adjust the `--concurrency` option's 
value. The default is 3.

The entire process will take a while, depending on the size of the content 
repository, available bandwidth, etc., but once completed, you'll have a 
complete local copy of everything the archive contains.
