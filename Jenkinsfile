pipeline {
	
	agent any 
	environment{
		
		Docker_User = credentials('dockerhub_user')
		Docker_Password = credentials('dockerhub_pass')
		Ver = "${env.BUILD_ID}"
		Name = "${env.JOB_NAME}"
		
	}         
		stages {                 
			stage('Prepare') {                         
				steps {                                 
					echo "$Docker_User"
				}                 
			}                 
			stage('Build') {                         
				steps {
					sh "docker rmi -f back" 
					sh "docker build -t back ."											               	                      
				}                 
			}                 

			stage('push') {
				steps {
					sh '''
						docker login -u $Docker_User -p $Docker_Password
						docker tag back felparejav/back:${Ver}
						docker push felparejav/back:${Ver}
						'''
				}
			}                 
         
		} 
} 
