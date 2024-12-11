pipeline {
    agent any
    stages {
        stage('Install Apache') {
            steps {
                script {

                    def apacheInstalled = sh(script: 'dpkg -l | grep apache2', returnStatus: true)
                    
                    if (apacheInstalled != 0) {
                        echo "Apache2 is not installed. Installing Apache..."
                        sh '''
                            sudo apt-get update
                            sudo apt-get install -y apache2
                        '''
                    } else {
                        echo "Apache2 is already installed."
                    }
                }
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
                sh 'chmod +x ./check_error_status_code.sh'
                sh './check_error_status_code.sh'

            }
        }
    }
}