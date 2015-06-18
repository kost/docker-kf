# k0st/kfni

Known Files Names - Ignore case sensitiveness (KFNI) 

Docker container to ask for filenames of known files. This version will ignore case sensitivity of file name
(by converting everything to uppercase). 
It shrinks big database (larger than 2 GB) to Docker container of less than 100 MB by using bloom filters.
Currently it is smallest known Docker implementation of such databases. It implements bloom filter from:

- NSRL from http://www.nsrl.nist.gov/Downloads.htm

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/k0st/kfni.svg)](https://imagelayers.io/?images=k0st/kfni:latest 'latest')

## Docker image usage

```
docker run k0st/kfni [FILENAME] [FILENAME] ...
```

## Examples

Check filename of notepad.exe

```
docker run --rm k0st/kfni nOtEpAd.exe
```

You can also check for multiple filenames on command line:

```
docker run --rm k0st/kfni notepad.exe calc.exe bloomutil.exe
```

You can start checking interactively (each pattern on each line):
```
docker run --rm k0st/kfni -f -
```

You can check from file (each patern on each line):
```
docker run --rm -v /path/to/host/dir/with/search.names/file:/work:rw k0st/kfni -f search.names 
```

#### Notice
Inspired by:

- https://github.com/blacktop/nsrl
- https://github.com/bigsnarfdude/Malware-Probabilistic-Data-Structres
