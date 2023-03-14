pipeline {
  agent {
    node {
      label 'nonprod'
    }

  }
  stages {
    stage('pre-build') {
      agent {
        node {
          label 'nonprod'
        }

      }
      steps {
        sh 'echo "Hello World!!!"'
      }
    }

  }
}