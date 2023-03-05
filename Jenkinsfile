pipeline {
    agent { label 'maven' }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhubtoken')
    }
    stages {
        stage('checkout') {
            steps {
                script {
                    def mvnProps = readMavenPom(file: 'pom.xml')
                    checkout scm
                }
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Artifactory upload'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'artifactoryToken', passwordVariable: 'password', usernameVariable: 'userName')]) {
                    sh "curl -u${userName}:${password} -T ${WORKSPACE}/target/${mvnProps.artifactId}-${mvnProps.version}.${mvnProps.packaging} https://selflearning.jfrog.io/artifactory/deploy-artifact/${mvnProps.artifactId}/${env.BUILD_NUMBER}/${mvnProps.artifactId}-${mvnProps.version}.${mvnProps.packaging}"

                }
            }
        }
        stage('Docker Build and Push') {
            steps {
                sh 'docker build -t bharathvasanthkumar/myjavaapp:latest .'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh "docker push bharathvasanthkumar/myjavaapp:${env.BUILD_NUMBER}"
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
