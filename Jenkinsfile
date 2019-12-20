pipeline {
    agent {
        /* docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }*/
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "tesing'
				myImage = docker.image("bclaster/jenkins-node:1.0")
				myImage.pull()
            }
        }
    }
}