pipeline {
    agent any
   
    stages {
        stage ('Initialize') {
            steps {
		checkout scm
                bat '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"	
		
                ''' 
            }
        }

        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
		bat 'mvn package'
            }
        }
    }
}