pipeline {
    agent any
   
    stages {
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
				bat 'D:\\apache-maven-3.6.3-bin\\apache-maven-3.6.3\\bin\\mvn package'
			}
        }
		stage ('upload') {
			steps {
				script {
				echo 'publishing artifacts to jfrog'
				
		
				def server = Artifactory.server 'Artifactory'
				
				rtUpload (
					server.credentialsId = 'JFROGID',
					spec: '''{
						  "files": [
							{
							  "pattern": "target/my-app-1.0-SNAPSHOT.jar",
							  "target": "example-repo-local/${BUILD_NUMBER}/"
							}
						 ]
					}''',
				 
					// Optional - Associate the uploaded files with the following custom build name and build number,
					// as build artifacts.
					// If not set, the files will be associated with the default build name and build number (i.e the
					// the Jenkins job name and number).
					buildName: 'holyFrog',
					buildNumber: "${env.BUILD_NUMBER}"
				)
			}
			}
		}
	}
}