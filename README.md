# Next.js + CloudRun + Github Actions

## Usage
CloudRun + iam + Conatiner Registry
```
cd tf-githubactions
terraform init
terraform apply
```
Secrets登録
```
GCP_REGION_PRD : asia-northeast1
GCP_PROJECT_ID_PRD
GOOGLE_IAM_WORKLOAD_IDENTITY_POOL_PROVIDER
SERVICE_ACCOUNT_EMAIL
```
Next.jsをGithub Actionsでデプロイ
```
git add .
git commit -m ""
git push
```