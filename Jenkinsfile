pipeline {

    agent any

    environment {
        APP_NAME = 'DevOps-Demo'
    }

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    parameters {

        string(
            name: 'VERSION',
            defaultValue: '1.0',
            description: 'Application version'
        )

        choice(
            name: 'ENVIRONMENT',
            choices: ['DEV', 'QA', 'PROD'],
            description: 'Select deployment environment'
        )

        booleanParam(
            name: 'DEPLOY',
            defaultValue: false,
            description: 'Deploy the application'
        )
    }

    stages {

        stage('Build') {
            steps {
                echo "Application: ${env.APP_NAME}"
                echo "Environment: ${params.ENVIRONMENT}"
                echo "Version: ${params.VERSION}"
                echo "Deploy requested: ${params.DEPLOY}"

                sh '''
                    echo "Application = ${env.APP_NAME}"
                    echo "Environment = ${parm.ENVIRONMENT}"
                    echo "Version = ${params.VERSION}"
                '''
            }
        }

        stage('Deploy') {
            when {
                expression {
                    params.deploy
                }
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
