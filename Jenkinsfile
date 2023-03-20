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
        sh '''pipeline { 
    agent any  
    stages { 
        stage(\'Build\') { 
            steps { 
               echo \'This is a minimal pipeline.\' 
            }
        }
    }
}'''
      }
    }

    stage('Docker build') {
      steps {
        sh '''pipeline {
    agent any
    tools { 
        maven \'Maven 3.3.9\' 
        jdk \'jdk8\' 
    }
    stages {
        stage (\'Initialize\') {
            steps {
                sh \'\'\'
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                \'\'\' 
            }
        }

        stage (\'Build\') {
            steps {
                echo \'This is a minimal pipeline.\'
            }
        }
    }
}'''
        }
      }

      stage('pushing image') {
        steps {
          sh '''pipeline {
    agent any
    tools {
        maven \'Maven 3.3.9\'
        jdk \'jdk8\'
    }
    stages {
        stage (\'Initialize\') {
            steps {
                sh \'\'\'
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                \'\'\'
            }
        }

        stage (\'Build\') {
            steps {
                sh \'mvn -Dmaven.test.failure.ignore=true install\' 
            }
            post {
                success {
                    junit \'target/surefire-reports/**/*.xml\' 
                }
            }
        }
    }
}'''
          }
        }

      }
    }