# terraform-demo
This repository is to show case how terraform works

Initialize terraform


#### Go to project directory
    cd terraform-demo/env

#### Initialize terraform

    $ AWS_PROFILE={profile_name} terraform init\   
        -backend-config="bucket={bucket_name}" \  
        -backend-config="key={statefile_name}.tfstate" \  
        -backend-config="region={bucket_region}"


#### Create plan

    $ AWS_PROFILE={profile_name} terraform plan \
              -out="/path/to/result.tfplan" \
              -var-file="../shared/terraform.tfvars" \
              -input=false

#### Apply the plan
    $ AWS_PROFILE={profile_name} terraform apply "/path/to/result.tfplan"`

#### Create plan to destroy

    $ AWS_PROFILE={profile_name} terraform plan \
              -out="/path/to/result.tfplan" \
              -var-file="../shared/terraform.tfvars" \
              -input=false \
              -destroy

use the same apply command once the above command is executed

#### To check format
    $ terraform fmt -check=true
    $ terraform fmt (to update file with formatting changes)

#### To initialize any new modules
    $ terraform get -update
