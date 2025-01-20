pipeline {
    agent any
    stages {
        stage('Checkout the Code from GitHub') {
            steps {
                git url: 'https://github.com/Chandan-3461/Banking-app'
                echo 'Code checked out from GitHub'
            }
        }
        stage('Code Compilation') {
            steps {
                echo 'Starting code compilation'
                sh 'mvn compile'
            }
        }
        stage('Code Testing') {
            steps {
                echo 'Running tests'
                sh 'mvn test'
            }
        }
        stage('Quality Assurance') {
            steps {
                echo 'Running quality checks'
                sh 'mvn checkstyle:checkstyle'
            }
        }
        stage('Package Application') {
            steps {
                echo 'Packaging application'
                sh 'mvn package'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                sh 'docker build -t chandan3461/bankingapp-img:latest .'
            }
        }
        stage('Login to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerpass', variable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u chandan3461 --password-stdin
                    '''
                }
                echo 'Logged in to DockerHub'
            }
        }
        stage('Publish the Image to DockerHub') {
            steps {
                echo 'Pushing Docker image to DockerHub'
                sh 'docker push chandan3461/bankingapp-img:latest'
            }
        }
        stage('ansible deployment') {
            steps {
                ansiblePlaybook credentialsId: 'ansible', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml', vaultTmpPath: ''
            }
        }
    }
}
