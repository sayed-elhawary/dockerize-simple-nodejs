pipeline {
    agent any
    stages {
        stage('Clone the repo') {
            steps {
                git url: "https://github.com/sayed-elhawary/dockerize-simple-nodejs", branch: "main"
            }
        }
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                sh """
                docker build . -t app
                docker login -u ${USERNAME} -p ${PASSWORD}
                """
            }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                sh 'docker run -p 3000:3000 -d app '
            }
        }
    }
  }
