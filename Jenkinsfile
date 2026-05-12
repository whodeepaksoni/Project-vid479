pipeline {

    agent any

    environment {
        IMAGE_NAME = "whodeepaksoni/website:${BUILD_NUMBER}"
        DEPLOYMENT_FILE = "deployment.yml"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh "sudo docker build -t $IMAGE_NAME ."
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
                    echo $DOCKER_PASS | sudo docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "sudo docker push $IMAGE_NAME"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                sudo kubectl apply -f deployment.yml

                sudo kubectl apply -f service.yml



                # Then update image
                sudo kubectl set image deployment/website-deployment \
                website=$IMAGE_NAME
                '''
            }
        }

        
        


        stage('Verify Deployment') {
            steps {
                sh 'sudo kubectl get deployments'
                sh 'sudo kubectl get pods'
                sh 'sudo kubectl get svc'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfullya 🚀'
        }

        failure {
            echo 'Pipeline failed ❌'
        }
    }
}