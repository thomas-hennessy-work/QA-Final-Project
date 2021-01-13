pipeline{
        agent any
        stages{
            stage('Test Application'){
                steps{
                    sh "./scripts/test.sh"
                }
            }
            stage('Setup Terraform'){
                when {
                    branch 'main'  
                }
                steps{
                    sh "./scripts/setup-live-environment.sh"
                }
                
                when {
                    branch 'development'
                }
                steps{
                    sh "./scripts/setup-staging-environment.sh"
                }
            }
            stage('Build Images'){
                when {
                    branch 'main'
                    branch 'development'
                }
                steps{
                    sh "./scripts/build.sh"
                }
            }
            stage('Deploy Application'){
                when {
                    branch 'main'
                    branch 'development'
                }
                steps{
                    sh "./scripts/deploy.sh"
                }
            }
        }
}