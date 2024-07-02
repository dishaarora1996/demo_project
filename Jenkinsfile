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
                    sshagent(credentials: [SSH_CREDENTIALS]) {
                        // Create directory on AWS server
                        def sshCommandResult = sshCommand remote: "ssh -o StrictHostKeyChecking=no ${SSH_USER}@${AWS_SERVER}",
                                                            command: "mkdir -p ${REMOTE_DIR_PATH}"
                                                            
                        // Check the result of the SSH command
                        if (sshCommandResult.exitStatus == 0) {
                            echo "Directory ${REMOTE_DIR_PATH} created successfully on AWS server"
                        } else {
                            error "Failed to create directory ${REMOTE_DIR_PATH} on AWS server. Exit status: ${sshCommandResult.exitStatus}"
                        }
                    }
                }
            }
        }
    }
}