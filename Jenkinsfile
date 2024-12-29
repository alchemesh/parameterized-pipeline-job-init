
pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package -DskipTests=true'
        archiveArtifacts 'target/hello-demo-*.jar'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
        junit(testResults: 'target/surefire-reports/TEST-*.xml', keepProperties: true, keepTestNames: true)
      }
    }
    
    stage('Containerization') {
      steps {
        sh 'echo Docker Build Image..'
        sh 'docker build -t sabatiel180/gs-spring-boot-docker:v1 .'
        sh 'echo Docker Tag Image....'
        sh 'echo Docker Push Image......'
        sh 'docker login --username sabatiel180 --password-stdin "poppey360!"'
        sh 'docker push sabatiel180/gs-spring-boot-docker:v1'
      }
    }

    stage('Kubernetes Deployment') {
      steps {
        sh 'echo Deploy to Kubernetes using ArgoCD'
      }
    }
    
    stage('Integration Testing') {
      steps {
        sh "sleep 20s"
        sh 'echo Testing using cURL commands......'
      }
    }
  }
  tools {
    maven 'M398'
  }

}
