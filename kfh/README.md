# k0st/kfh

Known Files Hashes (KFH)

Docker container to ask for hashes of known files. It shrinks big database (larger than 2 GB) to Docker container of less than 100 MB by using bloom filters.
Currently it is smallest known Docker implementation of such databases. It implements bloom filter from:

- NSRL from http://www.nsrl.nist.gov/Downloads.htm
- m-whitelist from https://www.mandiant.com/resources/download/redline

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image

## Docker image size

[![Latest](https://badge.imagelayers.io/k0st/kfh.svg)](https://imagelayers.io/?images=k0st/kfh:latest 'latest')

## Docker image usage

```
docker run k0st/kfh [MD5] [MD5] ...
```

## Examples

Check MD5 of notepad.exe (16f769bc1d37cc14e3093b9881cf1691)

```
docker run --rm k0st/kfh 16f769bc1d37cc14e3093b9881cf1691
```

You can also check for multiple MD5s on command line:

```
docker run --rm k0st/kfh 16f769bc1d37cc14e3093b9881cf1691 eeb024f2c81f0d55936fb825d21a91d6 62b84d99295346af5a3b1a9c3bde04ab
```

### Todo
- [x] Merge m-whitelist
- [ ] add interactive option (take input from stdin)

#### Notice
Inspired by:
- https://github.com/blacktop/nsrl
- https://github.com/bigsnarfdude/Malware-Probabilistic-Data-Structres
