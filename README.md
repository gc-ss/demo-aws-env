## Workplan
1. Set up remote Terraform State
- S3 Bucket
- DynamoDB Table for State Locking
2. Read up on best practices regarding Terraform Variables and Workspace Management
3. Define 'dev' and 'prod' TF Workspaces
4. Define VPC CIDR, Subnets CIDR, and Account Networking layout
5. Deploy all TF assets in dev Workspace for testing
6. If successful, delete all resources and redeploy to Prod workspace
** need to share state bucket between both
7. Deploy vault EC2 instance

* Need to understand best practices around 'bootstrapping' items for TF Remote State
- the answer to this is to use custom bootstrapping, TF Cloud, or terragrunt

It's "bootstrap", not "boostrap" - apparently I make a lot of typos with this.


