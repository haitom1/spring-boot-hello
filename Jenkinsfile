pipeline {
  agent {
    node {
      label 'nonprod'
    }

  }
  stages {
    stage('build') {
      agent {
        node {
          label 'nonprod'
        }

      }
      steps {
        sh 'echo "Hello World!!!"'
      }
    }

    stage('') {
      steps {
        build 'build'
      }
    }

  }
}