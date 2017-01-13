FROM jenkins

MAINTAINER Jiří Šimeček <jirka@simecek.org>

# Install Jenkins plugins
RUN install-plugins.sh \
    # Core plugins
    blueocean \
    docker-workflow \
    locale \

    # Pipeline related
    workflow-aggregator \
    pipeline-stage-view \

    # VCS related
    git \
    cloudbees-bitbucket-branch-source \
    github-organization-folder

# Install Docker binaries
# see: https://docs.docker.com/engine/installation/binaries/
USER root
RUN cd \
    && set -x \
    && curl -fSL "https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz" -o docker.tgz \
    && tar -xzvf docker.tgz \
    && mv docker/* /usr/local/bin/ \
    && rmdir docker \
    && rm docker.tgz

RUN usermod -aG staff jenkins \
    && usermod -aG docker jenkins

USER jenkins

VOLUME /var/run/docker.sock
