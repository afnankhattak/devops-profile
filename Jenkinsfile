pipeline {
  agent any
  environment {
		registryCredential = 'dockerhub' 
	}
  stages {
    stage('Build') {
			steps {
					sh 'docker build -t afnan39/profile-app:v1.0.3 .'
			} 
		}
    stage('Test') {
      steps {
				sh 'docker container run --rm -p 81:81 --name node1 -d afnan39/profile-app:v1.0.3' 
				sh 'sleep 5'
				sh 'curl -I http://localhost'
			
		} 
	}
    stage('Publish') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						sh 'docker push afnan39/profile-app:v1.0.3'
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