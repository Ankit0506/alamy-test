Terraform
-
- create main file we write out configutation of resources
- variable.tf file is to define the name of variable
- output file is to get the output or name of the resource,same we can used later.

Kubernetes
-
- Created deployment file to deploy our nginx app.
- lb service we have used and same will create lb in aws
- ingress service we have used this will do path based routing
- roles we have attached for security purpose.

Jenkins
-
- jenkinsfile will do the CICD for the application

Deployment steps
-
- Create eks cluster in the vpc that we created using terraform.
-  attached the service arn role for the same.
- attached worker node on same that we created using terraform.
- install kubectl on eks.
- create repo
- create the pipeline
- deploy the code
- try to access the application

