pipeline {
    agent any

    environment {
        //CURRENT_LIVE_BOX = readFile(file: '/var/lib/jenkins/env_vars/Live_Box.txt')
        //CURRENT_LIVE_BOX = readFile '/var/lib/jenkins/env_vars/Live_Box.txt'
        //CURRENT_LIVE_BOX = readFile encoding: 'us-ascii', file: '/var/lib/jenkins/env_vars/Live_Box.txt'
        //CURRENT_LIVE_BOX = readFile encoding: 'UTF-8', file: '/var/lib/jenkins/env_vars/Live_Box.txt'
        CURRENT_LIVE_BOX = 'Right-Box'
       }

    stages {
        stage("Write-File") {

            steps {
                echo CURRENT_LIVE_BOX
                    script {
                    writeFile(file:'/var/lib/jenkins/env_vars/Live_Box.txt', text: 'No-Box')
                }

            }
        }

    }
}