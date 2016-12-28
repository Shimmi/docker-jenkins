# Jenkins with Blue Ocean and support for builiding jobs in Docker
_For a new Jenkins experience._

Based on the [Official Jenkins Docker image](https://store.docker.com/images/d55eda09-d7f0-47b0-8780-3407f2f9142c "official image"). This image adds support for running Docker CLI inside the Jenkins
container and builiding the jobs using declarative pipelines with Docker. Bundled with Blue Ocean plugin.

## Note on the image
The image is automatically build on any change to the [Shimmi/docker-jenkins](https://github.com/Shimmi/docker-jenkins) repo and/or when [original Jenkins image](https://hub.docker.com/r/_/jenkins) changes. 

## What is a Pipeline?
Pipelines are a series of steps that allow you to orchestrate the work required to build, test and deploy applications. Pipelines are defined in a file called Jenkinsfile that is stored in the root of your project’s source repository.

## What is a Declarative pipeline?
Announced at Jenkins World on Wednesday 14th alongise with Blue Ocean the Declarative pipeline is a
new way of how to **configure** the Pipelines rather than **script** them.

Docker support in Declarative Pipeline allows you to version your application code, Jenkins Pipeline configuration, and the environment where your pipeline will run, all in a single repository. It’s a crazy powerful combination.

Declarative Pipeline introduces the postBuild section that makes it easy to run things conditionally at the end of your Pipeline without the complexity of the try... catch of Pipeline script.

### Example of Declarative pipeline
```
pipeline {
  agent docker:'php'
  stages {
    stage('build') {
      steps {
        sh 'php --version'    
      }
    }
  }
}
```

[See additional basic examples in another languages](https://github.com/jenkinsci/pipeline-model-definition-plugin/wiki/getting%20started#quick-start). 

## What is a Blue Ocean?
Blue Ocean is a new project that rethinks the user experience of Jenkins. Designed from the ground up for Jenkins Pipeline and compatible with Freestyle jobs, Blue Ocean reduces clutter and increases clarity for every member of your team.

![Blue Ocean](./docs/images/blue-ocean/pipeline-activity.png "Blue Ocean")

# Usage
_Please refer to the [original image](https://store.docker.com/images/d55eda09-d7f0-47b0-8780-3407f2f9142c?tab=description) description for additional configuration nad usage of the Jenkins docker image._

## Using `docker-compose`
1. Clone the repo or just the `docker-compose.yml` file.
2. Go to that folder and run `docker-compose up`.

## Run the image
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