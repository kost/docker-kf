# k0st/nsrl

This takes the 2.4GB NSRL minimal set and converts it into a less than 100MB bloomfilter

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image
and docker-nslr (https://github.com/blacktop/nsrl) with few improvements:

- replaced debian with alpine (smaller docker image)
- unhex characters before adding to bloom filter and when searching (smaller database size)

## Docker image size

[![Latest](https://badge.imagelayers.io/k0st/nsrl.svg)](https://imagelayers.io/?images=k0st/nsrl:latest 'latest')

## Docker image usage

```
docker run k0st/nsrl [MD5] [MD5] ...
```

## Examples

Check MD5 of notepad.exe (16f769bc1d37cc14e3093b9881cf1691)

```
docker run --rm k0st/nsrl 16f769bc1d37cc14e3093b9881cf1691
```

You can also check for multiple MD5s on command line:

```
docker run --rm k0st/nsrl 16f769bc1d37cc14e3093b9881cf1691 eeb024f2c81f0d55936fb825d21a91d6 62b84d99295346af5a3b1a9c3bde04ab
```
