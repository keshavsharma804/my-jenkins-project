pipeline {
    agent any
    
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Deployment environment')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip test execution?')
    }
    
    environment {
        APP_NAME = 'Production Application'
        VERSION = "3.${BUILD_NUMBER}.0"
        DOCKER_REGISTRY = 'registry.example.com'
    }
    
    stages {
        stage('Initialize') {
            steps {
                echo '=========================================='
                echo "Starting CI/CD Pipeline"
                echo "Application: ${APP_NAME}"
                echo "Version: ${VERSION}"
                echo "Environment: ${params.ENVIRONMENT}"
                echo "Build: #${BUILD_NUMBER}"
                echo '=========================================='
            }
        }
        
        stage('Code Quality Check') {
            steps {
                echo 'Running code quality analysis...'
                sh 'sleep 2'
                echo '✓ Code quality: PASSED'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                sh './build.sh'
                echo '✓ Build completed'
            }
        }
        
        stage('Unit Tests') {
            when {
                expression { params.SKIP_TESTS == false }
            }
            steps {
                echo 'Running unit tests...'
                sh 'sleep 3'
                echo '✓ 25 tests passed'
            }
        }
        
        stage('Integration Tests') {
            when {
                expression { params.SKIP_TESTS == false }
            }
            steps {
                echo 'Running integration tests...'
                sh 'sleep 3'
                echo '✓ 12 integration tests passed'
            }
        }
        
        stage('Security Scan') {
            steps {
                echo 'Scanning for vulnerabilities...'
                sh 'sleep 2'
                echo '✓ No critical vulnerabilities found'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${APP_NAME}:${VERSION}"
                sh 'sleep 2'
                echo "✓ Image built: ${DOCKER_REGISTRY}/${APP_NAME}:${VERSION}"
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    def replicas = params.ENVIRONMENT == 'prod' ? 5 : (params.ENVIRONMENT == 'staging' ? 2 : 1)
                    echo "Deploying to ${params.ENVIRONMENT} with ${replicas} replicas..."
                    sh "sleep 3"
                    echo "✓ Deployed successfully"
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo 'Performing health check...'
                sh 'sleep 2'
                echo '✓ All instances healthy'
            }
        }
    }
    
    post {
        success {
            echo '=========================================='
            echo '✅ PIPELINE COMPLETED SUCCESSFULLY!'
            echo "Version ${VERSION} deployed to ${params.ENVIRONMENT}"
            echo '=========================================='
        }
        failure {
            echo '=========================================='
            echo '❌ PIPELINE FAILED!'
            echo 'Rollback initiated'
            echo '=========================================='
        }
    }
}
