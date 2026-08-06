pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking Source Code'
            }
        }

        stage('Build') {
            steps {
                sh 'echo Building Application'
            }
        }

        stage('Test') {
            steps {
                sh 'echo Running Tests'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deploying Application'
            }
        }

    }
}
