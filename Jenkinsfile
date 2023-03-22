pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
					sh 'docker build -t afnan39/profile-app:v1.0.4 .'
			} 
		}
    stage('Test') {
      steps {
				sh 'docker container run --rm -p 81:81 --name node -d afnan39/profile-app:v1.0.4' 
				sh 'sleep 5'
				sh 'curl -I http://localhost:81'
			
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker push afnan39/profile-app:v1.0.4'
					} 
				}
			} 
		}


	stage('Clean') {
      steps{
        sh "docker rmi ${imageId}"
      }
    }	
	}
}