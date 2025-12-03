pipeline {
    agent any

    environment {
        IMAGE_NAME = "mynginx"
        NETWORK_NAME = "bis_network"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Nginx image') {
            steps {
                dir('nginx-app') {
                    sh """
                    docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                    """
                }
            }
        }

        stage('Run new Nginx container') {
            steps {
                script {
                    def containerName = "nginx_build_${BUILD_NUMBER}"
                    def hostPort = 9000 + BUILD_NUMBER.toInteger()

                    sh """
                    docker run -d \
                      --name ${containerName} \
                      --network ${NETWORK_NAME} \
                      -p ${hostPort}:80 \
                      ${IMAGE_NAME}:${BUILD_NUMBER}
                    """
                    echo "Conteneur deployé : ${containerName}"
                    echo "Accès : http://localhost:${hostPort}"
                }
            }
        }
    }

    post {
        success {
            echo "Déploiement réussi !"
        }
        failure {
            echo "Échec du déploiement du conteneur."
        }
    }
}
