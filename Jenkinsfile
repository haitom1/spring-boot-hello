pipeline {
    agent any
    tools {
        maven 'maven' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
		   docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                    	docker.build("das1942/java-spring-hello:${TAG}")
		   }
                }
            }
        }
	    stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("das1942/java-spring-hello:${TAG}").push()
                        docker.image("das1942/java-spring-hello:${TAG}").push("latest")
                    }
                }
            }
        }
    }
}
