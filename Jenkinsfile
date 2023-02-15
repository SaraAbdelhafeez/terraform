
pipeline {

  agent any
  parameters {
        booleanParam(name:'project', defaultValue: true, description:'this paramater help you to know project name')
        choice(name: 'namespace', choices:['dev','prod'], description: '' ) 
    }
  

  stages {
      stage('initializing terraform') {
          steps {
              echo "checking your code"
              echo "${params.namespace}"
              withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')])  {
                sh "terraform init --var-file ${params.namespace}.tfvars "
              }
          }
      }

      stage('build the environment') {
          
          steps {
            withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')])  {
              sh "terraform apply --var-file ${params.namespace}.tfvars -auto-approve" 
            }
          }
      }

      stage('deployment') {  
          steps {
              echo "your code is deployed right now"
              echo "this build number $BUILD_NUMBER"
          }
      }    
  }
  

}
