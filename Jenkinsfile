pipeline{
        agent any
        environment {
            TELEGRAM_BOT = credentials('TELEGRAM_BOT') 
            CHAT_ID = credentials('CHAT_ID')
        }
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
                post{
                    always{
                        sh 'cp -r /var/jenkins_home/tests/ $WORKSPACE/test-results'
                        junit '**/test-results/*.xml'
                    }
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20passed%20tests'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20failed%20tests'
                    }
                }
            }
            stage('Setup Kubernetes Cluster'){
                when {
                    anyOf{
                        branch 'master';
                        branch 'development'
                    }
                }
                steps{
                    sh "./scripts/setup-cluster.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=kubernetes%20cluster%20created'
                    }
                }
            }
            stage('Build Images'){
                when {
                    branch 'development'
                }
                steps{
                    sh "./scripts/build.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20successful'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20failed'
                    }
                }
            }
            stage('Start Environment Testing'){
                when {
                    not{
                        branch 'master'
                    }
                }
                steps{
                    sh "./scripts/integrationtesting.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20successful'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20failed'
                    }
                }
            }
            stage('Deploy Staging'){
                when {
                    branch 'development';
                }
                steps{
                    sh "./scripts/deploy-staging.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=staging%20environment%20deployed'
                        archiveArtifacts artifacts: 'ip.txt'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=staging%20environment%20failed%20to%20deploy'
                    }
                }
            }
            stage('Deploy Live'){
                when {
                    branch 'master';
                }
                steps{
                    sh "./scripts/deploy-live.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=application%20deployed'
                        archiveArtifacts artifacts: 'ip.txt'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=application%20failed%20to%20deploy'
                    }
                }
            }
        }
}
