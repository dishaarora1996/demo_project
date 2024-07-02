pipeline {
    agent any
    
    stages {
        stage('Copy Files to Server') {
            steps {
                script {
                    // Execute SSH commands on the AWS server
                    sshagent(credentials: ['ssh-key-id']) {
                        // Create directory on AWS server
                        // sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.219.222.96 uptime'
                        // sh "ssh ubuntu@34.219.222.96 'mkdir -p /home/ubuntu/project/new_project'"

                        // Step 1: Transfer Django project files to remote server
                        sh "rsync -avz --exclude=".git" /var/lib/jenkins/workspace/django-cicd ubuntu@34.219.222.96:/home/ubuntu/project"
                        sh "ssh ubuntu@34.219.222.96 'bash -s' < /home/ubuntu/project/envsetup.sh"
                        
                    }
                }
            }
        }
        
        stage('st3') {
            steps {
                echo 'Testing..'
            }
        }
        stage('st4') {
            steps {
                echo 'Deploying....'
            }
        }
    }


}