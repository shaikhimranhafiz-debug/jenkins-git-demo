pipeline {

    agent any

    environment {
        APP_NAME = 'DevOps-Demo'
        BUILD_DIR = 'build'
        ARTIFACT_NAME = 'application.tar.gz'
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
            description: 'Target environment'
        )

        booleanParam(
            name: 'DEPLOY',
            defaultValue: false,
            description: 'Deploy application'
        )
    }

    stages {

        stage('Checkout') {

            steps {
                echo "Source code checked out from GitHub"
            }
        }

        stage('Build') {

            steps {

                echo "Building ${env.APP_NAME}"
                echo "Version: ${params.VERSION}"
                echo "Environment: ${params.ENVIRONMENT}"

                sh '''
                    chmod +x app.sh
                    ./app.sh
                '''
            }
        }

        stage('Test') {

            steps {

                echo "Running application tests..."

                sh '''
                    echo "Running tests..."
                    test -f app.sh
                    echo "Tests passed"
                '''
            }
        }

        stage('Package') {

            steps {

                echo "Creating application package..."

                sh '''
                    rm -rf "$BUILD_DIR"
                    mkdir -p "$BUILD_DIR"

                    cp app.sh "$BUILD_DIR/"

                    tar -czf "$BUILD_DIR/$ARTIFACT_NAME" \
                        -C "$BUILD_DIR" app.sh

                    echo "Package created:"
                    ls -lh "$BUILD_DIR/$ARTIFACT_NAME"
                '''
            }
        }

        stage('Archive') {

            steps {

                echo "Archiving build artifact..."

                archiveArtifacts artifacts: 'build/application.tar.gz',
                                 fingerprint: true
            }
        }

        stage('Deploy') {

            when {
                expression {
                    params.DEPLOY
                }
            }

            steps {

                echo "Deployment requested"
                echo "Environment: ${params.ENVIRONMENT}"
                echo "Version: ${params.VERSION}"

                sh '''
                    echo "Deployment simulation"
                    echo "Deploying ${APP_NAME}"
                '''
            }
        }
    }

    post {

        always {
            echo "Pipeline execution completed."
        }

        success {
            echo "Pipeline completed successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        cleanup {
            echo "Performing cleanup actions."
        }
    }
}
