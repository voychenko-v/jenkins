pipeline {
    agent any
    stages {
        stage('Install Apache') {
            steps {
                sh '''
                    sudo apt update
                    sudo apt install -y apache2
                '''
            }
        }
        stage('Requests') {
            steps {
                sh 'curl -I http://localhost '
                sh 'curl -I http://localhost/error'
            }
        }
        stage('Check Error Status') {
            steps {
                sh '''
                    chmod +x ./check_error_status_code.sh
                    ./check_error_status_code.sh
                '''
            }
        }
    }
}