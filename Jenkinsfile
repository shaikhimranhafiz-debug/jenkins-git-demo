pipeline {

    agent any

    environment {
        APP_NAME = 'DevOps-Demo'
        ENVIRONMENT = 'DEV'
        VERSION = '1.0'
    }

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {

        stage('Build') {
            steps {
                echo "Application: $APP_NAME"
                echo "Environment: $ENVIRONMENT"
                echo "Version: $VERSION"

                sh '''
                    echo "Application = $APP_NAME"
                    echo "Environment = $ENVIRONMENT"
                    echo "Version = $VERSION"
                '''
            }
        }

        stage('Deploy') {

            when {
                branch 'main'
            }

            steps {
                echo "Deploying application..."
                sh 'echo Deploying to production'
            }
        }
    }

    post {

        always {
            echo "Pipeline execution completed."
        }

        success {
            echo "Build completed successfully!"
        }

        failure {
            echo "Build failed!"
        }

        cleanup {
            echo "Cleaning workspace..."
        }
    }
}
