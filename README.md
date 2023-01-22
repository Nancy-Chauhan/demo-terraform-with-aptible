# Aptible Work Sample
There are two parts to this -
1. The example app
2. Grafana for monitoring

## Steps to deploy
1. First deploy the app
   1. Change the folder to app - `cd app`
   2. Initialise the providers - `terraform init`
   3. Run `terraform plan`
   4. Read the plan, if all looks good, then apply - `terraform apply` and approve when asked 'yes'.
2. Now deploy Grafana
   1. Change directory to `grafana`
   2. Initialise the providers - `terraform init`
   3. Get the postgres db connection url string. Separate this connection url string to db_user, db_pass etc.
   4. Fill in the `.env` file with the correct values from the previous step.
   5. Set the env vars and run terraform plan - `source .env && terraform plan`
   6. Read the plan, if all looks good, then apply - `source .env && terraform apply` and approve when asked 'yes'.


## Install Terraform
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

To check if it is installed run the following: 

```
terraform -version
```

## Step 1: Install the provider aptible 

Authorization and Authentication is controlled using the same mechanism that the cli uses. Therefore, you should log into the account you want to use Terraform with using the aptible login CLI command before running any Terraform commands.

As another option the environment variables APTIBLE_USERNAME and APTIBLE_PASSWORD can be set for the provider to use. In this case it is strongly recommended that a robot account be used, especially as MFA needs to be disabled for truly automated runs.

Run the following command: 

``` 
terraform init
```


