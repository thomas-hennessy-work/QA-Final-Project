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
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20tests%20successful'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20tests%20failed'
                    }
                }
            }
            stage('Setup Live Environment'){
                when {
                    branch 'master'  
                }
                steps{
                    sh "./scripts/setup-live-environment.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=Live%20environment%20configured'
                    }
                }
            }
            stage('Setup Staging Environment'){
                when {
                    branch 'development'
                }
                steps{
                    sh "./scripts/setup-staging-environment.sh"
                }
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=Staging%20environment%20configured'
                    }
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
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20successful'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20build%20failed'
                    }
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
                post{
                    success {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + '%20deployed'
                    }
                    failure {
                        sh 'curl https://api.telegram.org/bot'+ TELEGRAM_BOT +'/sendMessage?chat_id=-'+ CHAT_ID +'\\&text=' + BRANCH_NAME + 'failed%20to%20deploy'
                    }
                }
            }
        }
}
