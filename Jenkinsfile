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


        stage ('Deployment Stage') {
            steps {
                withMaven(maven : 'maven_3_5_0') {
                    bat 'mvn deploy'
                }
            }
        }
        stage ('docker image build') {
            steps{
            bat 'docker build -t mywebapp/app:1.0.0 .'
                }
            }      
        stage ('docker image run') {
            steps{
            bat 'docker run -p 8080:8081 mywebapp/app:1.0.0'
                }
            }      
        }
}