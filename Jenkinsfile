pipeline{
        agent any
        stages{
            stage('Test Application'){
                when {
                    not{
                        branch 'master'
                    }
                }
                steps{
                    sh "./scripts/test.sh"
                }
            }
            stage('Setup Live Environment'){
                when {
                    branch 'master'  
                }
                steps{
                    sh "./scripts/setup-live-environment.sh"
                }
            }
            stage('Setup Staging Environment'){
                when {
                    branch 'development'
                }
                steps{
                    sh "./scripts/setup-staging-environment.sh"
                }
            }
            stage('Build Images'){
                when {
                    anyOf {
                        branch 'master';
                        branch 'development'
                    }
                }
                steps{
                    sh "./scripts/build.sh"
                }
            }
            stage('Deploy Application'){
                when {
                    anyOf {
                        branch 'master';
                        branch 'development'
                    }
                }
                steps{
                    sh "./scripts/deploy.sh"
                }
            }
        }
}
