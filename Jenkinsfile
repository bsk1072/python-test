pipeline {
    agent {
        docker { 
            image 'docker:latest' 
            args '--rm -v /var/run/docker.sock:/var/run/docker.sock -u root'
            
        }
    }
    environment {
        dockerimage = ("bsk1072/${env.JOB_BASE_NAME}").toLowerCase()
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
                img = docker.build("${dockerimage}", '.')
                }
            }
        }
        
        stage('BuildInside') {
            steps {
                script {
                 docker.image("${dockerimage}").withRun('-d=true') {
                       sh "ls"
                    }
                }
            }
          }
          
        stage('Publish the Docker image to dev registry') {
            steps {
                script {
                docker.withRegistry("https://registry.hub.docker.com", 'bsk1072') {
                    img.push("${env.BUILD_NUMBER}")
                }
                }
            }
        } 
        
        stage('Publish the Docker image to prod registry') {
            steps {
                script {
                docker.withRegistry("https://registry.hub.docker.com", 'bsk1072') {
                    img.push('latest')
                }
                }
            }
        }        
    }
}
