pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
					sh 'docker build -t afnan39/profile-app:v1.0.$BUILD_NUMBER .'
			} 
		}
    stage('Test') {
      steps {
				sh 'docker container run --rm -p 80:80 --name profile-app -d afnan39/profile-app:v1.0.$BUILD_NUMBER' 
				sh 'sleep 5'
				sh 'curl -I http://localhost:80'
			
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker push afnan39/profile-app:v1.0.$BUILD_NUMBER'
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
