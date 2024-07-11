pipeline {
    agent any
    stages {
      stage ("clean Up"){
            steps {
                sh "ls -la"
                deleteDir()
                sh "ls -la"
            }
        }
        stage ("Clone Repo"){
            steps {
                sh "git clone https://github.com/AsmaaSallam24/Database"
            }
        }
       stage('Check Parameterized Choice') {
            steps {
                script {
                    def selectedRequiredTask = params.Required-Task
                    echo "Selected Required-Task: ${selectedRequiredTask}"
                    
                    // Add your logic based on the selected environment
                    switch (Required-Task) {
                        case 'Deploy':
                            echo "This is a Deploy choice"
                            dir("Database/Deploy")
                            sh "ls -la"
                            // Add your commands for dev environment
                            break
                        case 'Revert':
                            echo " This is a Revert choice"
                            dir("Database/Revert")
                            sh "ls -la"
                            // Add your commands for qa environment
                            break
                        case 'Verify':
                            echo "This is a Verify choice"
                            dir("Database/Verify")
                            sh "ls -la"
                            // Add your commands for production environment
                            break
                        default:
                            error "Unsupported choice: ${Required-Task}"
                    }
                }
            }
        }
      }
}
