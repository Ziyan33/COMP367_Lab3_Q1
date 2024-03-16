pipeline {
    agent any

    environment {
        // The Docker Hub credentials ID configured in Jenkins' credentials store.
        DOCKER_CREDENTIALS_ID = 'docker-hub-creds333'
        // The full image name for Docker Hub.
        IMAGE = 'ziyan33/lab3_q1:1.0'
    }

    tools {
        // This will use the Maven version defined in Jenkins' Global Tool Configuration.
        maven 'M3'
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the version control system.
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                // Run the Maven build on Windows.
                bat 'mvn clean package'
            }
        }

        stage('Code Coverage') {
            steps {
                // Generate a code coverage report.
                bat 'mvn jacoco:report'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the project.
                    // The docker build command is the same on Windows as on Unix systems.
                    docker.build(env.IMAGE)
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials stored in Jenkins.
                    docker.withRegistry('https://registry.hub.docker.com', env.DOCKER_CREDENTIALS_ID) {
                        // This block ensures you're logged into Docker Hub.
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push the image to Docker Hub.
                    docker.image(env.IMAGE).push()
                }
            }
        }
    }

    post {
        success {
            // This will run after the build if it's successful.
            echo 'The build was successful, and the Docker image was pushed to Docker Hub.'
        }
        failure {
            // This will run after the build if it fails.
            echo 'The build failed. Check the logs for errors.'
        }
        always {
            // This will run after the build regardless of its status.
            echo 'The pipeline has completed.'
        }
    }
}
