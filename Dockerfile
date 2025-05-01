# Pull from rocker project
FROM rocker/verse:4.4

# Install system libraries for Java, rJava, Git, and XML/SSL support
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      default-jdk \
      git \
      libcurl4-openssl-dev \
      libssl-dev \
      libxml2-dev && \
    rm -rf /var/lib/apt/lists/*

# Ensure JAVA_HOME is set for rJava
ENV JAVA_HOME=/usr/lib/jvm/default-java

# Install pak
RUN R -e "install.packages('pak')"

# Install rTASSEL
RUN R -e "pak::pak('maize-genetics/rTASSEL@v0.10.0')"
