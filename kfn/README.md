# k0st/kfn

Known Files Names (KFN)

Docker container to ask for filenames of known files. It shrinks big database (larger than 2 GB) to Docker container of less than 100 MB by using bloom filters.
Currently it is smallest known Docker implementation of such databases. It implements bloom filter from:

- NSRL from http://www.nsrl.nist.gov/Downloads.htm

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/k0st/kfn.svg)](https://imagelayers.io/?images=k0st/kfn:latest 'latest')

## Docker image usage

```
docker run k0st/kfn [FILENAME] [FILENAME] ...
```

## Examples

Check filename of notepad.exe

```
docker run --rm k0st/kfn notepad.exe
```

You can also check for multiple filenames on command line:

```
docker run --rm k0st/kfn notepad.exe calc.exe bloomutil.exe
```

You can start checking interactively (each pattern on each line):
```
docker run --rm k0st/kfn -f -
```

You can check from file (each patern on each line):
```
docker run --rm -v /path/to/host/dir/with/search.names/file:/work:rw k0st/kfn -f search.names 
```

#### Notice
Inspired by:

- https://github.com/blacktop/nsrl
- https://github.com/bigsnarfdude/Malware-Probabilistic-Data-Structres
