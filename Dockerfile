### Dockerfile for rTASSEL

FROM rocker/rstudio:4.3.1

# Install OS-level dependencies including git
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jdk \
    git \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME for rJava
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Define package lists
ARG CRAN_PACKAGES="rJava,tidyverse,ape,cli,ggplot2,plotly,rlang,tibble,vctrs,knitr,magrittr,rmarkdown,testthat"
ARG BIOC_PACKAGES="GenomicFeatures,AnnotationDbi,GenomicRanges,IRanges,S4Vectors,SummarizedExperiment,BiocStyle"

# Install CRAN packages
RUN Rscript -e "install.packages(strsplit(Sys.getenv('CRAN_PACKAGES'), ',')[[1]], repos='https://cloud.r-project.org')"

# Install Bioconductor packages
RUN Rscript -e "if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager', repos='https://cloud.r-project.org'); BiocManager::install(strsplit(Sys.getenv('BIOC_PACKAGES'), ',')[[1]])"

# Install rTASSEL from GitHub
RUN Rscript -e "if (!requireNamespace('remotes', quietly=TRUE)) install.packages('remotes', repos='https://cloud.r-project.org'); remotes::install_github('maize-genetics/rTASSEL')"

# Expose RStudio Server port
EXPOSE 8787
