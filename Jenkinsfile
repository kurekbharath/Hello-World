pipeline {
    agent any
   
    stages {
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
			}
        }
		stage ('upload') {
			steps {
				script {
					myImage = docker.image("bclaster/jenkins-node:1.0")
					myImage.pull()
				}
			}
		}
	}
}