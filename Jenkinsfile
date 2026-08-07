pipeline {

    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        APP_NAME = "DevOps-Demo"
        ENVIRONMENT = "DEV"
        VERSION = "1.0"
    }

    stages {

        stage('Build') {

            steps {

                echo "Application: ${APP_NAME}"
                echo "Environment: ${ENVIRONMENT}"
                echo "Version: ${VERSION}"

                sh '''
                    echo "Application = $APP_NAME"
                    echo "Environment = $ENVIRONMENT"
                    echo "Version = $VERSION"
                '''
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
