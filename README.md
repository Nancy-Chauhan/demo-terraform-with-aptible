# Deploy InfluxDB and Grafana on Aptible to monitor the health of the infrastructure with Terraform

![demo-aptible](https://user-images.githubusercontent.com/37153406/214064210-c761b238-6a24-4008-bd00-342efb244ffe.png)

## Prerequisites
Before you begin, you should have the following available:

1. An Aptible Account, as shown in [Get Started](https://deploy-docs.aptible.com/docs/get-started)  
2. Download the [Aptible CLI](https://deploy-docs.aptible.com/docs/cli)
3. Add an [SSH Key](https://deploy-docs.aptible.com/docs/public-key-authentication) to your account.
4. Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your local machine


There are two parts to this: 
1. Using Terraform deploy the application and its databases. Deploy an Influx DB and Metric Drain to persist metrics for the long term. 
2. Deploy, set up Grafana using Terraform. 

## Steps to deploy
Clone the repository and follow the steps: 

### 1. First deploy the demo app, databases and metric drain
   1. Change the folder to app - `cd app`
   2. Initialise the providers - `terraform init`
   3. Run `terraform plan`
   4. Read the plan, if all looks good, then apply - `terraform apply` and approve when asked 'yes'.
 
### 2.Configuring Postgres DB for grafana and substitue the config value in `.env` file

#### Configuring the Database

##### 1. Create a tunnel using the command:

```
aptible db:tunnel $HANDLE --environment $ENVIRONMENT
```

##### 2. Now connect using psql 

```
psql -Atx $DB_CONNECTION_URI
```


##### 3. Run the following commands to create a sessions database for use by Grafana:

```
CREATE DATABASE sessions;
```

```
\c sessions;
```
Create a table for Grafana to store sessions in: 

```
CREATE TABLE session (
        key       CHAR(16) NOT NULL,
        data      BYTEA,
        expiry    INTEGER NOT NULL,
        PRIMARY KEY (key)
);
```
#### Substitue the config value in `.env` file

1. Change directory to `grafana`
2. Copy `.env.example` and create `.env` file 
3. Fill the config values from your db credentials which is under database tab of your aptible environement dashboard

 ![image](https://user-images.githubusercontent.com/37153406/214068124-84f81432-8b1b-4a5d-a6b9-d979216e08af.png)


### 3. Now deploy Grafana
   1. Change directory to `grafana`
   2. Initialise the providers - `terraform init`
   3. Get the postgres db connection url string. Separate this connection url string to db_user, db_pass etc.
   4. Fill in the `.env` file with the correct values from the previous step.
   5. Set the env vars and run terraform plan - `source .env && terraform plan`
   6. Read the plan, if all looks good, then apply - `source .env && terraform apply` and approve when asked 'yes'.


You can now create a dashboard as your grafana is deployed on endpoints by terraform. 
