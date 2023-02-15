
pipeline {
  withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
    agent any
    parameters {
        booleanParam(name:'terraform', defaultValue: true, description:'this paramater help you to know project name')
        choice(name: 'env-param', choices:['dev','prod'], description: 'the workspace' ) 
    }

    stages {
        stage('initializing terraform') {
            steps {
                echo "checking your code"
                echo "${params.env-param}"
                sh "terraform init --var-file ${params.env-param}.tfvars -auto-approve"

            }
        }

        stage('build the environment') {
            when {
                expression{
                    params.terraform == true 
                }
            }
            steps {
                sh "terraform apply --var-file ${params.env-param}.tfvars -auto-approve" 
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
}
