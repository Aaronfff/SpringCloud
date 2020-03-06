pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo "hello world"'
                sh 'cd /home/github/SpringCloud'
                sh './install.sh'
            }
        }
    }
}