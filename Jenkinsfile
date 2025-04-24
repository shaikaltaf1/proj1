pipeline {
    agent none
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials("c4d49f55-1693-4a40-a8d9-e7819d963d0b")
    }

    stages {
        stage('git checkout') {
            agent {
                label 'K_M_JS'
            }
            steps {
                script {
                    git 'https://github.com/shaikaltaf1/proj1.git'
                }
            }
        }
        stage('docker') {
            agent {
                label 'K_M_JS'
            }
            steps {
                script {
                    sh 'sudo docker build . -t shaikaltaf1/project2'
                    sh 'sudo docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}'
                    sh 'sudo docker push shaikaltaf1/project2'
                }
            }
        }
        stage('kubernetes') {
            agent {
                label 'K_M_JS'
            }
            steps {
                script {
                    sh 'kubectl delete deployment proj-deployment'
                    sh 'kubectl apply -f deployment.yml'
                    sh 'kubectl delete service my-service'
                    sh 'kubectl apply -f service.yml'
                }
            }
        }
    }
}
