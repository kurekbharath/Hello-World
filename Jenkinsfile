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
				zip dir: "C://Program Files (x86)//Jenkins//workspace//Mavenproject//target//my-app-1.0-SNAPSHOT.jar", glob: '', zipFile: "${WORKSPACE}//my-app-1.0-SNAPSHOT.zip"
				def VersionInputs = input message: "Please provide the  version to upload to JFROG",
				parameters: [string(defaultValue: '', description: 'Pass the version convention ', name: 'Version', trim: true)]
				env.Version	= VersionInputs
			
				echo "Upload version for : ${Version}"
		
				def server = Artifactory.server 'Artifactory'
				rtUpload (
					serverId: 'Artifactory',
					spec: '''{
						  "files": [
							{
							  "pattern": "target/*.jar",
							  "target": "artifactory-build-info/${Version}/"
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