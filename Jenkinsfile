pipeline {
    agent any
    
    environment {
        APP_NAME = 'MyJenkinsProject'
        VERSION = '3.0.0'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo "Checking out ${APP_NAME}..."
                echo "Git Branch: ${GIT_BRANCH}"
                echo "Git Commit: ${GIT_COMMIT}"
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                sh '''
                    echo "Files in repository:"
                    ls -la
                    
                    echo "Validating build script..."
                    chmod +x build.sh
                    ./build.sh
                '''
            }
        }
        
        stage('Package') {
            steps {
                echo "Packaging ${APP_NAME} version ${VERSION}..."
                sh '''
                    echo "Creating deployment package..."
                    tar -czf app-${VERSION}.tar.gz index.html styles.css app.js
                    echo "Package created: app-${VERSION}.tar.gz"
                    ls -lh app-*.tar.gz
                '''
            }
        }
    }
    
    post {
        success {
            echo "✅ ${APP_NAME} v${VERSION} built successfully!"
        }
    }
}
