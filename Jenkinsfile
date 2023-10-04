pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('mootazhajji-dockerhub')
  }
  stages {
    stage('BUILD') {
      steps {
        sh 'docker build -t mootazhajji/alpine:1.0.0 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push mootazhajji/alpine:1.0.0'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
