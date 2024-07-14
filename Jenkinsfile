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
                deleteDir()
                sh "ls -la"
            }
        }
        stage ("Clone Repo"){
            steps {
                sh "git clone https://github.com/AsmaaSallam24/Database"
		sh "ls -la"
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
			    sh "cat deployScript.sql"
			// Example: Connect to MySQL and run SQL script
			    sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < deployScript.sql"
				
								}                          
                            break
                        case 'Revert':
                            echo " This is a Revert choice"
                            dir('Database/Revert'){
                            sh "ls -la"
			    sh "cat revertScript.sql"
			// Example: Connect to MySQL and run SQL script
			   sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < revertScript.sql"
	
                            }
                            // Add your commands for qa environment
                            break
                        case 'Verify':
                            echo "This is a Verify choice"
                            dir('Database/Verify'){
                            sh "ls -la"
			    sh "cat verifyScript.sql"
			// Example: Connect to MySQL and run SQL script
			    sh "mysql -h ${env.DB_HOST} -P ${env.DB_PORT} -u ${env.DB_USER} -p${env.DB_PASSWORD} ${env.DB_NAME} < verifyScript.sql"
	
                            }
                             break
                        default:
                            error "Unsupported choice: ${Required-Task}"
                    }
              }
            }
        }
      }
}
