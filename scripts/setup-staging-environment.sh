cd terraform/environments/staging
terraform init 
terraform plan --var-file=staging.tfvars -out=stagingplan
terraform apply "stagingplan"
az aks get-credentials --resource-group stagingResources --name aks_cluster --overwrite-existing
cd ../../../