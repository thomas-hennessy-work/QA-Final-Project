terraform init 
terraform plan --var-file=live.tfvars -out=liveplan
terraform apply "liveplan"