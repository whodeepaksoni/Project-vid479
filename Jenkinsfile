pipeline {

    agent any

    environment {
        IMAGE_NAME = "whodeepaksoni/website:${BUILD_NUMBER}"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('DockerHub Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-001',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                sh '''
                sudo kubectl set image deployment/website-deployment \
                website=$IMAGE_NAME
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'sudo kubectl get pods'
                sh 'sudo kubectl get svc'
            }
        }
    }

    post {

        success {
            echo 'Pipeline executed successfully'
        }

        failure {
            echo 'Pipeline failed'
        }
    }
}