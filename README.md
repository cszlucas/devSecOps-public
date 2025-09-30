# AWS DevSecOps Project

This project demonstrates a complete DevSecOps pipeline using AWS, Terraform, Docker, Kubernetes, and GitHub Actions. It deploys a containerized Flask application with proper security configurations and infrastructure as code.

## Project Structure

```
.
├── app/
│   └── hello.py                # Flask application
├── k8s/                        # Kubernetes infrastructure
│   ├── main.tf                 # K8s cluster configuration
│   └── variables.tf            # K8s variables
├── server/                     # AWS server infrastructure
│   ├── key-pair.tf            # EC2 key pair configuration
│   ├── main.tf                # EC2 instance and security groups
│   ├── provider.tf            # AWS provider configuration
│   └── variables.tf           # Server variables
├── .github/workflows/
│   └── deploy.yml             # GitHub Actions pipeline
├── Dockerfile                  # Container configuration
└── README.md
```

## Components

### Flask Application
- Simple Hello World application
- Containerized using Python 3.8 Flask image
- Exposed on port 80

### Infrastructure as Code (Terraform)
- **Server Configuration**
  - EC2 instance (t2.micro)
  - Security groups for SSH (22), HTTP (80), and custom port (3000)
  - Key pair management
  
- **Kubernetes Configuration**
  - AWS EKS cluster setup
  - Security group configurations
  - Core count management

### Security Features
- Restricted security group access
- SSH key authentication
- HTTPS/TLS configuration (TODO)
- Container security best practices

### CI/CD Pipeline
GitHub Actions workflow for automated:
- Code checkout
- Build process
- Testing (TODO)
- Deployment (TODO)

## Setup Instructions

### Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform installed
- Docker installed
- kubectl installed
- Python 3.8+

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/cszlucas/devSecOps-public.git
   cd devSecOps-public
   ```

2. **Run Flask app locally**
   ```bash
   cd app
   export FLASK_APP=hello.py
   export FLASK_ENV=development
   flask run
   ```
   Access at: http://127.0.0.1:5000

3. **Build and run with Docker**
   ```bash
   docker build -t hello-app .
   docker run -p 127.0.0.1:3000:80 hello-app
   ```
   Access at: http://localhost:3000

### Infrastructure Deployment

1. **Initialize Terraform**
   ```bash
   # For server infrastructure
   cd server
   terraform init
   terraform plan
   terraform apply

   # For Kubernetes infrastructure
   cd ../k8s
   terraform init
   terraform plan
   terraform apply
   ```

2. **Configure kubectl**
   ```bash
   aws eks update-kubeconfig --region <your-region> --name <cluster-name>
   ```

## Development Workflow

1. Make changes to the application code
2. Build and test locally using Docker
3. Push changes to GitHub
4. GitHub Actions will automatically trigger the pipeline
5. Infrastructure changes should be made through Terraform

## Security Considerations

- All security groups are configured with minimal required access
- SSH access is restricted and requires key authentication
- Application runs in isolated container
- Infrastructure is version controlled and changes are tracked
- Secrets management through AWS KMS (TODO)

## Future Improvements

- [ ] Add comprehensive testing in CI/CD pipeline
- [ ] Implement HTTPS/TLS
- [ ] Add monitoring and logging
- [ ] Implement AWS KMS for secrets management
- [ ] Add application health checks
- [ ] Implement auto-scaling
- [ ] Add backup and disaster recovery
- [ ] Implement WAF and DDoS protection

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License, which means:

- ✓ You can freely use, copy, modify, and distribute this code
- ✓ You can use it for commercial projects
- ✓ You don't have to share your modifications
- ✓ You must include the original license and copyright notice
- ✓ The software comes with no warranty

See the [LICENSE](LICENSE) file for the full legal text.
