**Pushing Docker Image to Amazon ECR**
Overview
This guide provides instructions on how to push a Docker image from your local machine to an Amazon Elastic Container Registry (ECR) repository. The necessary infrastructure (EC2 instance and ECR repository) has been set up using Terraform.

**Prerequisites**
Infrastructure:

An EC2 instance created using Terraform.
An ECR repository created using Terraform.
Local Machine:

Docker installed on your local machine.
AWS CLI installed and configured on your local machine.
EC2 Instance:

Docker installed on the EC2 instance.
AWS CLI installed and configured on the EC2 instance.
Steps
1. Set Up Docker on Your Local Machine
Build the Docker Image:

Navigate to your project directory and build your Docker image:

docker build -t my-docker-image .
Replace my-docker-image with a name for your Docker image.

Tag the Docker Image:

Tag the Docker image with your ECR repository URI:

docker tag my-docker-image:latest 975050264165.dkr.ecr.us-east-1.amazonaws.com/my-ecr-repo:latest
Replace 975050264165.dkr.ecr.us-east-1.amazonaws.com/my-ecr-repo with your ECR repository URI.

2. Authenticate Docker with ECR
Get the Login Password:

Use the AWS CLI to authenticate Docker to your ECR registry:

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 975050264165.dkr.ecr.us-east-1.amazonaws.com
Replace us-east-1 and 975050264165.dkr.ecr.us-east-1.amazonaws.com with your region and ECR registry URI.

3. Push Docker Image to ECR
Push the Docker Image:

Push the Docker image to your ECR repository:

docker push 975050264165.dkr.ecr.us-east-1.amazonaws.com/my-ecr-repo:latest
This command uploads your Docker image to the specified ECR repository.

4. Verify the Image in ECR
Check the ECR Repository:

Log in to the AWS Management Console.
Navigate to ECR.
Open your repository (my-ecr-repo).
Verify that the Docker image is listed in the repository.
Troubleshooting
Authentication Issues: Ensure that your AWS CLI is correctly configured with the necessary permissions to access ECR.
Push Errors: Verify that the image name and tag match what is expected in your ECR repository.
**Summary**
This guide outlined the steps to push a Docker image from your local machine to an Amazon ECR repository. The infrastructure was set up using Terraform, and the Docker image was managed and uploaded using Docker and AWS CLI commands.

