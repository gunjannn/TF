pipeline{
agent any
     stages{
    stage('SCM Checkout'){
         steps{
        git url:  'https://github.com/gunjannn/TF.git',branch: 'master'
    }
    }
    /*stage(" Maven Clean Package"){
  //    def mavenHome = tool name: "localmaven", type: "maven"
  //    def mavenCMD = "${mavenHome}/bin/mvn"
      sh "mvn clean package"
      
    } */
    
    
    /*stage('Build Docker Image'){
        sh 'docker rmi dockergunn/bg:v1'
        sh 'docker rmi  dockergunn/bg:v2'
        sh 'docker build -t dockergunn/bg:v1 .'
        
    } */
    
    /*stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'DOKCER_HUB_PASSWORD', variable: 'DOKCER_HUB_PASSWORD')]) {
          sh "docker login -u dockergunn -p ${DOKCER_HUB_PASSWORD}"
        }
        sh 'docker push dockergunn/bg:v1'
        
     } */
   
/*stage('Set Terraform path') {
   def tfHome = tool name: 'Terraform'
   env.PATH = '${tfHome}:${env.PATH}'
   }*/
 
      
     stage('Provision infrastructure'){
          steps{
       tool name: 'Terraform', type: 'terraform'
      sh "terraform -version" 
      sh "terraform init /var/lib/jenkins/workspace/terraform@2"

      sh "terraform plan -out=plan"
 // sh ‘terraform destroy -auto-approve’
      sh "terraform apply plan"
 }  
 }

/*def servicePrincipalId = '3461446c-1154-4720-95f3-6c1309af3507'
def resourceGroup = 'vm-rg'
def aks = 'k8s-bg'*/
     stage("Deploy To AKS"){
          steps{
acsDeploy azureCredentialsId: 'k8s-bg', 
configFilePaths: 'k8s-bg-blue.yml, k8s-bg-green.yml, k8s-bg-service.yml',
containerRegistryCredentials: [[credentialsId: 'dockergunn', url: 'https://hub.docker.com/repository/docker/dockergunn']], 
containerService: 'k8s-bg | AKS', 
dcosDockerCredentialsPath: '', 
resourceGroupName: 'vm-rg', 
secretName: '', sshCredentialsId: ''
}
}
}
}
