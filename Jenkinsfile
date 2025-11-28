pipeline {
    agent any

    environment {
        IMAGE_DEV = "nickchinnas/devops-build"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/nithinamigo/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_DEV:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    """
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_DEV:latest'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
            
              
