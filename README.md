# Jenkins with Blue Ocean and support for building jobs in Docker
_For a new Jenkins experience._

## Supported tags and respective `Dockerfile` links
* `lts` [(lts/Dockerfile)](https://github.com/Shimmi/docker-jenkins/blob/master/lts/Dockerfile) - Long term support
* `latest` [(latest/Dockerfile)](https://github.com/Shimmi/docker-jenkins/blob/master/latest/Dockerfile) - Weekly updates

[![dockeri.co](http://dockeri.co/image/shimmi/jenkins)](https://registry.hub.docker.com/shimmi/jenkins/)

[![](https://images.microbadger.com/badges/image/shimmi/jenkins.svg)](https://microbadger.com/images/shimmi/jenkins "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shimmi/jenkins.svg)](https://microbadger.com/images/shimmi/jenkins "Get your own version badge on microbadger.com")
[![GitHub issues](https://img.shields.io/github/issues/shimmi/docker-jenkins.svg "GitHub issues")](https://github.com/Shimmi/docker-jenkins/issues)
[![GitHub stars](https://img.shields.io/github/stars/shimmi/docker-jenkins.svg "GitHub stars")](https://github.com/Shimmi/docker-jenkins/stargazers)

Based on the [Official Jenkins Docker image](https://store.docker.com/community/images/jenkins/jenkins "official image"). This image adds support for running Docker CLI inside the Jenkins container and building the jobs using declarative pipelines with Docker. Bundled with [Blue Ocean](https://jenkins.io/projects/blueocean/).

## Note on the image
The image is automatically built on any change pushed to the [Shimmi/docker-jenkins](https://github.com/Shimmi/docker-jenkins) repo and/or when [original Jenkins image](https://store.docker.com/community/images/jenkinsci/jenkins) changes.

## What is a Pipeline?
Pipelines are a series of steps that allow you to orchestrate the work required to build, test and deploy applications. Pipelines are defined in a file called `Jenkinsfile` that is stored in the root of your project’s source repository.

## What is a Declarative pipeline?
Announced at Jenkins World on 14th of September 2016 along with the Blue Ocean, the Declarative pipeline is a new way of how to **configure** the Pipelines rather than **script** them.

Docker support in Declarative Pipeline allows you to version your application code, Jenkins Pipeline configuration, and the environment where your pipeline will run, all in a single repository. It’s a crazy powerful combination.

Declarative Pipeline introduces the `postBuild` section that makes it easy to run things conditionally at the end of your Pipeline without the complexity of the try... catch of Pipeline script.

### Example of Declarative pipeline
```
pipeline {
  agent { docker 'php' }
  stages {
    stage('build') {
      steps {
        sh 'php --version'    
      }
    }
  }
}
```
[See additional basic examples in another language](https://github.com/jenkinsci/pipeline-model-definition-plugin/wiki/getting%20started#quick-start).

## What is a Blue Ocean?
Blue Ocean is a new project that rethinks the user experience of Jenkins. Designed from the ground up for Jenkins Pipeline and compatible with Freestyle jobs, Blue Ocean reduces clutter and increases clarity for every member of your team.

![Blue Ocean](https://raw.githubusercontent.com/Shimmi/docker-jenkins/master/docs/images/blue-ocean/pipeline-activity.png "Blue Ocean")

# Usage
_Please refer to the [official documentation](https://github.com/jenkinsci/docker/blob/master/README.md) description for additional configuration and usage of the Jenkins docker image._

## Using `docker-compose`
1. Clone the repo or just the `docker-compose.yml` file.
2. Go to that folder and run `docker-compose up -d`.

### Upgrading
1. Prepare Jenkins to shutdown (Manage Jenkins > Prepare for Shutdown).
2. Go to your `docker-compose.yml` folder.
4. Run `docker-compose up -d` again to recreate the container with new image and run it as a daemon.

## Using `docker run`
You can also run the image without any cloning by using the `docker run` command.

`docker run -d --name my_jenkins -v /your/home/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 shimmi/jenkins`

Please alter the `/your/home/jenkins_home` path to your needs.

### E.g. On windows:
`docker run -d --name my_jenkins -v /C/Users/<your-profile>/Documents/docker/jenkins/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 shimmi/jenkins`

# Resources
* [Pipeline model definition - Wiki](https://github.com/jenkinsci/pipeline-model-definition-plugin/wiki/getting%20started)
* [Jenkins Handbook - Pipeline](https://jenkins.io/doc/book/pipeline/)
* [Announcing the Blue Ocean beta, Declarative Pipeline and Pipeline Editor - Jenkins blog](https://jenkins.io/blog/2016/09/19/blueocean-beta-declarative-pipeline-pipeline-editor/)
* [Jenkins - Blue Ocean](https://jenkins.io/projects/blueocean/)
