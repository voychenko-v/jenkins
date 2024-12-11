pipeline {
    agent any
    stages {
        stage('Instal Apache') {
            steps {
                sh 'sudo apt install apache2'
            }
        }
        stage('Chec status') {
            steps {
                sh './check_error_status_code.sh'
            }
        }

    }
}