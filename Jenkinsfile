pipeline {
    agent any
   
    stages {
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
				// bat 'D:\\apache-maven-3.6.3-bin\\apache-maven-3.6.3\\bin\\mvn package'
			}
        }
		stage ('upload') {
			steps {
				script {
				echo 'publishing artifacts to jfrog'
				
					try{
						def server = Artifactory.server 'Artifactory'
						server.credentialsId = 'JFROGID'
							def uploadSpec = """{
								"files": [
									{
										"pattern": "pom.xml",
										"target": "example-repo-local/${env.BUILD_NUMBER}/",
										"props": "build.number= ${env.BUILD_NUMBER}"
									}
								]
							}"""			
						def buildInfo = server.upload spec: uploadSpec
						
						buildInfo.number = "${env.BUILD_NUMBER}"
						server.publishBuildInfo buildInfo 
						
					
					
					}
					
				
					 catch (err) {
						echo err.getMessage()
						echo "Error detected, but we will continue."
					}
				}
			}
		}
	}
}