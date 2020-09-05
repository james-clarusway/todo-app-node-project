pipeline {
    agent { label "master" }
    environment {
        ECR_REGISTRY = "846133131154.dkr.ecr.eu-central-1.amazonaws.com"
        APP_REPO_NAME= "clarusway-repo/todo-app"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build --force-rm -t "$ECR_REGISTRY/$APP_REPO_NAME:latest" .'
                sh 'docker image ls'
            }
        }
        stage('Push Image to ECR Repo') {
            steps {
                sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin "$ECR_REGISTRY"'
                sh 'docker push 846133131154.dkr.ecr.eu-central-1.amazonaws.com/clarusway-repo/todo-app:latest'
            }
        }
    }
    post {
        always {
            echo 'Deleting all local images'
            sh 'docker image prune -af'
        }
    }
}
