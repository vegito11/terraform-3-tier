## Project Structure

The project has the following directory structure:

   1. `infra`: This directory holds subdirectories for backend and frontend resources. These could be different components of your application's infrastructure.

   2. `modules`: This directory contains reusable Terraform modules. The example provided includes a module named `vpc`.

## Usage

> Navigate to the specific directory (e.g., infra/backend or infra/frontend) where you want to deploy infrastructure. 

> Review and modify the terraform.auto.tfvars file with appropriate values.

1. Initialize Terraform:

   ```bash
   BACKEND_DIR=infra/backend
   FRONTED_DIR=infra/frontend
   DIR=$BACKEND_DIR
   terraform -chdir=${DIR} init
   ```

1. Plan your infrastructure:

   ```bash
   terraform -chdir=${DIR} plan
   ```

1. Apply your infrastructure changes:

   ```bash
   terraform -chdir=${DIR} apply
   ```

   Confirm by typing `yes` when prompted.

## Cleaning Up

When you're done using the resources, you can destroy them using Terraform:

1. Navigate to the project directory.

2. Run the destroy command:

   ```bash
   terraform destroy -chdir=${DIR}
   ```

   Confirm by typing `yes` when prompted.
