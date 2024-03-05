pipeline {
    agent any
    tools {
        maven "MAVEN3"
    }

    stages {
                stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Use isUnix() method to determine which command to run based on OS
                    if (isUnix()) {
                        sh "${env.MAVEN_HOME}/bin/mvn clean install"
                    } else {
                        bat "${env.MAVEN_HOME}\\bin\\mvn clean install"
                    }
                }
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