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
        stage('Test requests') {
            steps {
                sh 'curl -I http://localhost' // 200
                sh 'curl -I http://localhost/error' // 404
                sh 'curl -I http:/192.168.1.200' // 500
            }
        }
        stage('Check logs') {
            steps {
                sh 'sudo ls /var/log/apache2/'
            }
        }
        stage('Check Error Status') {
            steps {
                sh 'chmod +x ./check_error_staus_code.sh'
                sh './check_error_staus_code.sh'
            }
        }
        stage('Uninstall Apache') {
            steps {
                echo "Uninstalling Apache2..."
                sh '''
                    sudo apt-get remove --purge -y apache2
                    sudo apt-get autoremove -y
                    sudo apt-get clean
                '''
            }
        }
    }
}