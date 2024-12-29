
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
        sh 'docker build -t springio/gs-spring-boot-docker .'
        sh 'echo Docker Tag Image....'
        sh 'echo Docker Push Image......'
        sh 'docker run -p 8180:8180 springio/gs-spring-boot-docker'
      }
    }

    stage('Kubernetes Deployment') {
      steps {
        sh 'echo Deploy to Kubernetes using ArgoCD'
      }
    }
    
    stage('Integration Testing') {
      steps {
        sh "sleep 10s"
        sh 'echo Testing using cURL commands......'
        sh 'curl http://localhost:8180'
      }
    }
  }
  tools {
    maven 'M398'
  }

}
