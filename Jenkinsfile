pipeline {
    agent any

    stages {
        stage ('Compile Stage') {

            steps {
                withMaven(maven : 'maven_3_5_0') {
                    bat 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'maven_3_5_0') {
                    bat 'mvn test'
                }
            }
        }


        stage ('Package Stage') {
            steps {
                withMaven(maven : 'maven_3_5_0') {
                    bat 'mvn package'
                }
            }
        }
        stage ('docker image build') {
            steps{
            bat 'docker build -t demo/app:1.0 .'
                }
            }      
        stage ('docker image run') {
            steps{
               bat 'echo "Docker run" '
            bat 'docker run -d -p 8080:8080 demo/app:1.0'
                }
            }      
        
        stage ('docker image push') {
            steps{
                withCredentials([string(credentialsId: 'dockerPwd', variable: 'dockerHubPwd')]){
                    bat "docker login -u sankpra34 -p ${dockerHubPwd}"
                }
                bat 'docker tag demo/app:1.0 sankpra34/demoapp'
                bat 'docker push sankpra34/demoapp'
                }
            }
        
        }
}
