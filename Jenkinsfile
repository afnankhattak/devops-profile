pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
					sh 'docker build -t afnan39/profile-app:v1.0.${env.BUILD_NUMBER} .'
			} 
		}
    stage('Test') {
      steps {
				sh 'docker container run --rm -p 81:81 --name node1 -d afnan39/profile-app:v1.0.${env.BUILD_NUMBER}' 
				sh 'sleep 5'
				sh 'curl -I http://localhost'
			
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker push afnan39/profile-app:v1.0.${env.BUILD_NUMBER}'
					} 
				}
			} 
		}
    stage('Trigger ManifestUpdate') {
		    steps{
                echo "triggering profile-app-production"
                build job: 'profile-app-production', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]

			}
        }

		
	}
}