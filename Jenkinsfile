pipeline {
agent {
label 'jenkins-agent'
}

environment {
    IMAGE_NAME = "asia-south1-docker.pkg.dev/devops-elk-project/mario-repo/mario-app"
    IMAGE_TAG  = "${BUILD_NUMBER}"
}

stages {

    stage('Checkout') {
        steps {
            git branch: 'main',
                credentialsId: 'github-ssh',
                url: 'git@github.com:sidharth-sehrawat/ELK-project.git'
        }
    }

stage('Gitleaks Scan') {
    steps {
        sh '''
        gitleaks detect . \
        --no-git \
        --verbose
        '''
    }
}

    stage('Trivy Filesystem Scan') {
        steps {
            sh '''
            trivy fs . --severity HIGH,CRITICAL || true
            '''
        }
    }
stage('Debug Workspace') {
    steps {
        sh '''
        pwd
        ls -la
        ls -la mario
        '''
    }
}
    stage('Build & Push Image') {
        steps {
            container('kaniko') {
                sh '''
                /kaniko/executor \
                  --context=${WORKSPACE}/mario \
                  --dockerfile=${WORKSPACE}/mario/Dockerfile \
                  --destination=${IMAGE_NAME}:latest \
                  --destination=${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }
    }

    stage('Deploy to GKE') {
        steps {
            sh '''
            kubectl set image deployment/mario-app \
            mario-app=${IMAGE_NAME}:latest \
            -n default

            kubectl rollout status deployment/mario-app \
            -n default --timeout=300s
            '''
        }
    }
}

post {

    success {
        echo 'Pipeline completed successfully.'
    }

    failure {
        echo 'Pipeline failed.'
    }
}


}

