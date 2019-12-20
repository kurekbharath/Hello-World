pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				script {
					sh 'echo "tesing'
					
				}
			}
		}
		stage('Docker') {
			steps {
				script {
					myImage = docker.image("bclaster/jenkins-node:1.0")
					myImage.pull()
				}
			}
		}
	}
}