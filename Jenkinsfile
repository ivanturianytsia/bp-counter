node {
    checkout scm
    try {
      stage("Build") {
          sh 'chmod -R 777 .'
          sh 'docker run --rm \
            -v /root/docker/jenkins/workspace/bp-counter:/go/src/counter \
            -w /go/src/counter \
            golang:latest bash -c "./build.sh alpine"'
          sh 'bash build.sh image'
      }
      stage("Publish") {
          withDockerRegistry([credentialsId: 'DockerHub']) {
              sh 'bash build.sh push'
          }
      }
    } catch(error) {
      throw error
    } finally {
      sh 'rm -rf *'
    }
}
