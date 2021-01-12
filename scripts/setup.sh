az aks get-credentials --resource-group liveResources --name aks_cluster
cd terraform 
terraform init
terraform apply -auto-approve