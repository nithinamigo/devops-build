pipeline {
    agent any

    environment {
        DOCKERHUB = credentials('dockerhub')
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
                sh 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_DEV:latest'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}

