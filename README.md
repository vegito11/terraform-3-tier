## Project Structure

The project has the following directory structure:

   1. `infra`: This directory holds subdirectories for backend and frontend resources. These could be different components of your application's infrastructure.

   2. `modules`: This directory contains reusable Terraform modules. The example provided includes a module named `vpc`.

## Usage


1. Initialize Terraform:

   ```bash
   terraform init
   ```

1. Plan your infrastructure:

   ```bash
   terraform plan
   ```

1. Apply your infrastructure changes:

   ```bash
   terraform apply
   ```

   Confirm by typing `yes` when prompted.

## Cleaning Up

When you're done using the resources, you can destroy them using Terraform:

1. Navigate to the project directory.

2. Run the destroy command:

   ```bash
   terraform destroy
   ```

   Confirm by typing `yes` when prompted.
