# rTASSEL + Docker

Docker image for `rTASSEL` published as [`maizegenetics/rtassel_docker`](https://hub.docker.com/r/maizegenetics/rtassel_docker) on Docker Hub.

The **Dockerfile** and **GitHub Action that builds and pushes** this image live in the **[rTASSEL](https://github.com/maize-genetics/rTASSEL)** repository:

- [`docker/Dockerfile`](https://github.com/maize-genetics/rTASSEL/blob/master/docker/Dockerfile)
- [`.github/workflows/docker-publish.yaml`](https://github.com/maize-genetics/rTASSEL/blob/master/.github/workflows/docker-publish.yaml)

This repo is kept as a lightweight pointer for discoverability. **Do not duplicate Docker Hub publish workflows here**—that would race with rTASSEL and push twice.

## Image contents

- RStudio Server
- CRAN packages: `ape`, `cli`, `knitr`, `plotly`, `rlang`, `tidyverse`, `vctrs`
- Bioconductor packages: `BiocStyle`, `AnnotationDbi`, `GenomicFeatures`, `GenomicRanges`, `IRanges`, `S4Vectors`, `SummarizedExperiment`

## When images are published

On each **`v*.*.*` tag push** to rTASSEL, the **Publish Docker image** workflow pushes `maizegenetics/rtassel_docker:<tag>` and `:latest`. See rTASSEL [`CONTRIBUTING.md`](https://github.com/maize-genetics/rTASSEL/blob/master/.github/CONTRIBUTING.md) for required Docker Hub secrets.

## Local build

Clone rTASSEL, check out the desired tag, then from the repo root:

```bash
docker build --build-arg RTASSEL_TAG=v0.12.0 -f docker/Dockerfile -t rtassel:local .
```

The Hub image **`maizegenetics/rtassel`** is deprecated; use **`maizegenetics/rtassel_docker`** instead.
