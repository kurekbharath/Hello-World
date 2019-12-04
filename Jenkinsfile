pipeline {
    agent any
   
    stages {
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
		bat 'C:\Program Files\apache-maven-3.6.3\bin\mvn package'
            }
        }
    }
}