pipeline {
    agent any
    tools {
        maven "M2"
    }

    stages {
        stage('Build') {
            steps {
                // Executes the Maven build command. 'clean install' will clean the previous build artifacts and then build the project.
                sh 'mvn clean install'
            }
        }
    }
     post {
            success {
                echo 'Build was successful!'
            }
            failure {
                echo 'Build failed.'
            }
        }
}
