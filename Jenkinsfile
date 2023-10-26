def COLOR_MAP = ['SUCCESS': 'good', 'FAILURE': 'danger','UNSTABLE': 'danger']
pipeline {
    agent {
       node {
          label 'java17'
       }
    }
    options { skipStagesAfterUnstable() }
    environment {
    credentialsId= 'ci-git-checkout'
    teamsUrl = credentials('Jenkins-webhook-url')
    }
    stages { 
         stage('Build and Upload Image') {
                    steps {
                       sh "docker build --network=host -t 552533246600.dkr.ecr.ap-south-1.amazonaws.com/mp-frontend:${env.BRANCH_NAME}-${env.BUILD_ID} ."
                        script{
                         docker.withRegistry("https://552533246600.dkr.ecr.ap-south-1.amazonaws.com", "ecr:ap-south-1:AWS_CREDENTIALS"){   
                          sh "docker push 552533246600.dkr.ecr.ap-south-1.amazonaws.com/mp-frontend:${env.BRANCH_NAME}-${env.BUILD_ID}"
                         }
                   }
             }
         }
         
         stage('Deploy'){
            environment {
                GIT_CREDS = credentials('ci-git-checkout')
                HELM_GIT_REPO_URL = "https://github.com/mealplanetcorp/mp-helm.git"
                GIT_REPO_EMAIL = 'panimalar.s@mealplanet.com'
                GIT_REPO_USERNAME = "panimalars"
                GIT_REPO_BRANCH = "${env.BRANCH_NAME}"
                IMAGE_TAG = "${env.BRANCH_NAME}-${env.BUILD_ID}"
            }
            steps{
                    withCredentials([gitUsernamePassword(credentialsId: 'ci-git-checkout', gitToolName: 'git-tool')]) {
                      sh '''
                           #!/bin/bash
                           if [ -d "mp-helm" ]
                           then
                             rm -r mp-helm
                           fi
                         '''
                      sh "git clone ${env.HELM_GIT_REPO_URL}"
                      sh "git config --global user.email ${env.GIT_REPO_EMAIL}"
                      sh "git config --global user.name ${env.GIT_REPO_USERNAME}"
                      sh "git checkout ${env.GIT_REPO_BRANCH}"
                      sh '''
                           #!/bin/bash
                           echo $GIT_REPO_EMAIL
                           echo $GIT_COMMIT
                           pwd
                           ls -lth
                           cd /data/builder/workspace/mp-frontend_develop/mp-helm/mp-frontend
                           cat values.yaml
                           yq eval '.image.tag = env(IMAGE_TAG)' -i values.yaml
                           cat values.yaml
                           pwd
                           git add values.yaml
                           git commit -m "Triggered Build"
                           echo $HELM_GIT_REPO_URL
                           git push $HELM_GIT_REPO_URL
                           '''
                    }
               }

             }
      }
      post {
        success{
            echo '========pipeline executed successfully ========'
            office365ConnectorSend color: COLOR_MAP.SUCCESS, 
                                   message: "Marketplace Service Build ${env.BUILD_ID} succeeded on ${env.BRANCH_NAME}. ", 
                                   status: 'Success',
                                   webhookUrl: teamsUrl
        }
        failure{
            echo '========pipeline execution failed========'
            office365ConnectorSend color: COLOR_MAP.FAILURE, 
                                   message: "Marketplace Service Build ${env.BUILD_ID} failed on ${env.BRANCH_NAME}.", 
                                   status: 'Failure',
                                   webhookUrl: teamsUrl
        }
    }
}
