# Terraform implementation for Elastic Kubernetes Service

This repository contains the terraform definition of the following resources:

- A VPC with public and private subnets -- and associated resources (IGW, RTs, NATGWs, etc.)
- EKS cluster, cluster addons (EBS CSI Driver, VPC CNI, kube-proxy and CoreDNS)
- Deployment of argocd via helm_release.
- Deployment of aws-load-balancer-controller via helm_release.
- Remote terraform state using encrypted S3 backend and dynamodb_table for avoiding concurrent terraform executions.
- Kubernetes Cluster autoscaler: https://docs.aws.amazon.com/eks/latest/userguide/autoscaling.html

The argocd service can be accessible via the ELB URL: https://a44e2b17677bc4d9993f3e6ae36148fd-308439214.us-east-1.elb.amazonaws.com/


TO DO:

- To better improve this terraform definition repository. I'd suggest creating a terraform module and use it in a per environment basis.
I started developing the prod cluster directly in the prod directory, and due to the lack of time, I'm just duplicating the directory and using different state locations.