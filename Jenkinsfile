pipeline {
    agent {
        docker { image 'docker:latest' }
    }
    stages {
        stage('Test') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                def img = docker.build('bsk1072/python-example:latest', '.')
                }
            }
        }
        stage('Publish the Docker image to Registry') {
            steps {
                script {
                docker.withRegistry('https://registry.hub.docker.com', 'bsk1072') {
                    img.push('latest')
                }
                }
            }
        }        
    }
}
