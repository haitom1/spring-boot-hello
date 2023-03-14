pipeline {
  agent {
    node {
      label 'nonprod'
    }

  }
  stages {
    stage('build') {
      steps {
        build 'build java'
      }
    }

  }
}