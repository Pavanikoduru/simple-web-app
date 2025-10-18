# simple-web-app
Automated Kubernetes Deployment - Hello World Web App

This README lists the main steps and commands to deploy a simple web application to AWS EKS using Terraform, Docker, and Kubernetes.

1. Clone Repository
git clone https://github.com/Pavanikoduru/simple-web-app.git
cd simple-web-app

2. Configure Git
git config --global user.name "******
git config --global user.email "******@gmail.com"

3. Configure AWS CLI
aws configure
Enter Access Key, Secret Key, region (ap-south-1), output format (json)

4. Terraform Steps
Initialize Terraform: terraform init
Plan Terraform: terraform plan
Apply Terraform: terraform apply
Terraform Outputs: terraform output

5. Docker Commands
Build Docker Image: docker build -t hello-world-app .
Tag & Push Image:
docker tag hello-world-app <docker-repo>:latest
docker push <docker-repo>:latest

7. Kubernetes Deployment
Update kubeconfig:
aws eks update-kubeconfig --region ap-south-1 --name hello-world-cluster
Apply Kubernetes Manifests:
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Verify Deployment:
kubectl get pods
kubectl get svc

8. Git Commands
Check Status:
git status
Add & Commit Changes:
git add .
git commit -m "Commit message"
Pull Latest Changes:
git pull origin main --no-rebase
Push Changes:
git push origin main
Notes
Recommended EC2 instance type for Terraform operations: t3.medium

Ensure the EKS cluster is created successfully before running kubectl commands.

Resolve any merge conflicts in Git before pushing.
