pipeline {
  agent any
  
  environment {
      IMAGE = "likhith045/go-web-app"
  }

  stages {

    stage('Clone') {
      steps {
        git branch: 'main',
            url: 'https://github.com/likhith777666/simple-web-application-using-go.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE:$BUILD_NUMBER .'
      }
    }

    stage('Push Image') {
      steps {
        sh 'docker login -u likhith04* -p ********'
        sh 'docker push likhith045/go-web-app:$BUILD_NUMBER'
      }
    }
    
    stage('Deploy to k8s') {
      steps {
        sh '''
        export KUBECONFIG=/var/jenkins_home/kubeconfig
        kubectl apply -f k8s/
        '''
      }
    }
     stage('Update Deployment Image') {
            steps {
               sh '''
        export KUBECONFIG=/var/jenkins_home/kubeconfig
        kubectl set image deployment/go-web-app-deployment go-web-app-deployment=$IMAGE:$BUILD_NUMBER -n go-web-app
        '''
            }
        }
    
  }
}
