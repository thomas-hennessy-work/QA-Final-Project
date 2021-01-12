pipeline{
        agent any
        stages{
            stage('Install Terraform'){
                steps{
                    sh "./scripts/install-terraform.sh"
                }
            }
            stage('Setup Terraform'){
                steps{
                    sh "./scripts/setup-live-environment.sh"
                }
            }
            stage('Build Images'){
                steps{
                    sh "./scripts/build.sh"
                }
            }
            stage('Test Application'){
                steps{
                    sh "./scripts/test.sh"
                }
            }
            stage('Deploy Application'){
                steps{
                    sh "./scripts/deploy.sh"
                }
            }
        }
}