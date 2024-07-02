pipeline {
    agent any
    
    environment {
        // Define credentials for SSH access to the target server
        SSH_CREDENTIALS = credentials('ssh-key-id')  // SSH credentials ID from Jenkins
        TARGET_SERVER = '34.219.222.96'  // IP address or hostname of your AWS server
        SSH_USER = 'ubuntu'  // SSH username for the target server
        REMOTE_DIR_PATH = '/home/ubuntu/project/new_project'  // Path to where the Django project will be deployed
    }
    
    stages {
        stage('SSH Connection and Directory Creation') {
            steps {
                script {
                    // Execute SSH commands on the AWS server
                    sshagent(credentials: ['ssh-key-id']) {
                        // Create directory on AWS server
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.219.222.96 uptime'
                    }
                }
            }
        }
    }
}