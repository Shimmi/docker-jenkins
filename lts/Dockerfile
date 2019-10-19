FROM jenkins/jenkins:lts

MAINTAINER Patrick Adler <patrick@padler.org>

USER root

RUN apt-get update && apt-get upgrade -y

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    software-properties-common

RUN curl -fsSL https://get.docker.com/ | sh

RUN usermod -aG docker,staff jenkins

USER jenkins

# Install Jenkins plugins
RUN install-plugins.sh \
    blueocean \
    docker-workflow \
    locale \
    workflow-aggregator \
    pipeline-stage-view \
    git \
    cloudbees-bitbucket-branch-source \
    github-organization-folder
