pipeline {
   agent any

   environment {
            AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
            AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        }

   stages {
      stage('scm checkout') {
         steps {
            // Get code from a GitHub repository
	    echo 'retrieving code form scm'
            git 'https://github.com/chine-imo/WAIP.git'
	    echo 'code retrivial from scm complete'
         }
      }

   stage('initialize tf') {
         steps {
            // initialize configuration files in working diectory
	    echo 'initializing working directory'
            sh 'terraform init'
	    echo 'initialization complete'
         }
      }

      stage('validate tf') {
         steps {
            // validates the configuration files in a directory
	    echo 'validating terraform config files'
            sh 'terraform validate'
	    echo 'validation complete'
         }
      }

      stage('plan tf') {
         steps {
            // create terraform execution plan
	    echo 'runnign terraform plan'
            sh 'terraform plan'
	    echo 'planning complete'
         }
      }

      stage('apply tf') {
         steps {
            // validates the configuration files in a directory
	    echo 'applying terraform config to environment' 
            sh 'terraform apply -auto-approve'
	    echo 'deployment complete'
         }
      }

      
   }
}
