
# Provisioning 2 teir Infrastructure  for Application using Terraform 


Implement resilent & scalable  2 teir infrastructure for application  in AWS using Terraform 

# Project overview

This project ensure  us to deploy a highly available, scalable, and secure 2-tier architecture on Amazon Web Services (AWS) using Terraform. The architecture consists of the following two tiers:

- Routing : The application is accessible with a secure domain name with SSL certificate.Routing traffic towards the servers with low latency 

- Application Tier: Application servers run our business logic and interact with the database tier. They can also be horizontally scaled to meet demand.

- Database Tier: The database stores and manages our application data. In this architecture, we use Amazon Aurora Postgresql for a managed database service.
  




## Architecture Diagram 
## Features

- convert project into modules that increase collaboration within team and encourage the DRY (Don't Repeat Yourself ) principle   
-  Secure data or credentials sent between a website and a browser, or between two servers, by encrypting it using SSL certificate
- Reduce thetime & manual Provisioning and increase collaboration within teams by using Terraform
- Aurora PostgreSQL offers a powerful combination of performance, global reach, and cost-effectiveness. It delivers up to 3x the throughput of standard PostgreSQL and operates as a global database spanning multiple AWS Regions, ensuring fast local reads worldwide. Its serverless capability automatically scales resources based on demand, significantly reducing costs by eliminating over-provisioning and idle time.
- Implement the Database in a private subnet for secure the credentias and data and oly accessible for instance 



## Prerequisites

- Having knowledege of Terraform 
- Having knowledege of AWS(cloud)

## Resources

- vpc
- public subnets
- private subnets
- Autoscaling 
- Load Balancer ( application)
- Target group
- launch Template 
- Certificate Manager ( SSL )
- CloudFront
- Route53
- Security Groups 
- Aurora Database ( Postgresql)
- Custom Enpoints
## Deployment
 1. Clone the repository:
   
```bash
   https://github.com/SagarRawat24/provisioning-2teir-infrastucture-.git
 ```

 2. Make changes as per your needs.

 3. Initialize Terraform and apply the configuration:
 ```   
    terraform init    
 ```    
 4. Validate the files 
 ```   
    terraform validate     
 ```
 5. Review the changes and confirm then apply the achanges 
 ```   
    terraform apply -auto-approve    
 ```        

 6. Destory the all resources 
  ```   
    terraform destroy -auto-approve    
 ```
## SreenShots
![Screenshot 2024-07-30 115637](https://github.com/user-attachments/assets/e0f7209b-89b0-4860-a3aa-43b40177e354)
![Screenshot 2024-07-18 005238](https://github.com/user-attachments/assets/d3ad58c0-1d5b-4f91-8345-047f7ae28e2a)
![Screenshot 2024-07-17 223638](https://github.com/user-attachments/assets/2a46ca26-800b-47da-a243-b3c9aa36a04d)

