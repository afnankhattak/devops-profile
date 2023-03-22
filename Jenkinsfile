pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
					sh 'docker build -t afnan39/profile-app .'
			} 
		}
    stage('Test') {
      steps {
				sh 'docker container run --rm -p 89:89 --name node1 -d afnan39/profile-app' 
				sh 'sleep 5'
				sh 'curl -I http://localhost:89'
			
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker push afnan39/profile-app:${env.BUILD_NUMBER}'
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