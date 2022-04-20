#!groovy
topolology_url = "or-large"
def runTest(application) {
	
		echo "application: $application"
		echo pwd
		sh "pwd"
		dir("test-${application}") {	
			sh "cd /home/developer/robot_framework_example/ && make test-${application}"
		}
}

testParams = [:]

pipeline {
  agent any
  parameters {
    booleanParam(name: 'leaf_spine_onboarding',
                 defaultValue: true,
		 description: 'Run the leaf_spine_onboarding test suite')	 
    choice(name: 'OR_PODS', choices: ['testbed1', 'testbed2', 'testbed3', 'testbed4'], description: 'This will work only stage1 is clicked')                 
  }


stages {		
        stage('Test Leaf Spine Onboarding') {
          when {
            expression { params.leaf_spine_onboarding == true }
          }
          steps {
            script {
              var = params.OR_PODS
              echo "VAR  $var"
	      
	      runTest('leaf-spine-onboarding')
            }
          }
        }     
      }
}
