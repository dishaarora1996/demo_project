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
                        sh 'rsync -avz --exclude=".git" /var/lib/jenkins/workspace/django-cicd ubuntu@34.219.222.96:/home/ubuntu/project'

                        // Step 2: Install virtualenv and set up environment
                        sh 'ssh ubuntu@34.219.222.96 "python3 -m venv /home/ubuntu/project/env"'
                        // sh 'ssh ubuntu@34.219.222.96 "source /home/ubuntu/project/env/bin/activate"'
                        // sh 'ssh ubuntu@34.219.222.96 "pip3 install -r requirements.txt"'
                        // sh 'ssh ubuntu@34.219.222.96 "pip3 install -r requirements.txt"'
                        sh "ssh ubuntu@34.219.222.96 'chmod +x /home/ubuntu/project/django-cicd/envsetup.sh'"
                        sh 'ssh ubuntu@34.219.222.96 "bash /home/ubuntu/project/django-cicd/envsetup.sh"'
                        
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