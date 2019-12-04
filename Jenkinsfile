pipeline {
    agent any
   
    stages {
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
		bat 'D:\\apache-maven-3.6.3-bin\\apache-maven-3.6.3\\bin\\mvn package'
		
            }
        }
    }
}