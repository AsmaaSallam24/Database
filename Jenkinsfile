pipeline {
    agent any
    
	
	environment {
			// Define database credentials and connection details
			DB_HOST = 'localhost'
			DB_PORT = '3306'
			DB_NAME = 'PROD'
			DB_USER = 'asmaa'
			DB_PASSWORD = 'as2441966'
				}
				
				
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
                    def selectedRequiredTask = params.Required_Task
                    echo "Selected Required-Task: ${selectedRequiredTask}"
                    
                    // Add your logic based on the selected environment
                    switch (selectedRequiredTask) {
                        case 'Deploy':
                            echo "This is a Deploy choice"
                            dir('Database/Deploy'){
                            sh "ls -la"
							// Example: Connect to MySQL and run SQL script
							sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < deployScript.sql"
	
									// Define post-actions, notifications, etc. if required
								}

                            // Add your commands for dev environment
                            break
                        case 'Revert':
                            echo " This is a Revert choice"
                            dir('Database/Revert'){
                            sh "ls -la"
							// Example: Connect to MySQL and run SQL script
							sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < revertScript.sql"
	
                            }
                            // Add your commands for qa environment
                            break
                        case 'Verify':
                            echo "This is a Verify choice"
                            dir('Database/Verify'){
                            sh "ls -la"
							// Example: Connect to MySQL and run SQL script
							sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < verifyScript.sql"
	
                            }
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
