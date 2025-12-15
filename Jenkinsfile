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

                    sh """
                    docker rm -f ${containerName} 2>/dev/null || true
                    docker run -d \
                      --name ${containerName} \
                      --network ${NETWORK_NAME} \
                      ${IMAGE_NAME}:${BUILD_NUMBER}
                    """
                    echo "Conteneur deployé : ${containerName}"
                }
            }
        }

        stage('Test Nginx inside Docker network') {
            steps {
                sh """
                docker run --rm --network ${NETWORK_NAME} curlimages/curl:8.10.1 \
                  -sS http://nginx_build_${BUILD_NUMBER}:80 | head -n 5
                """
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
