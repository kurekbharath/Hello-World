pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				script {
					sh 'echo "tesing'
					myImage = docker.image("bclaster/jenkins-node:1.0")
					myImage.pull()
				}
			}
		}
	}
}