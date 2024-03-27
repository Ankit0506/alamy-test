pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/alamy-test/repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
      stage('Apply Kubernetes Manifests') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/

                }
            }
        }
    }

    post {
        always {
            deleteDir()
        }
    }
}
