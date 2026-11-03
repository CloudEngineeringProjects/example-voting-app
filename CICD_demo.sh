#Login to Azure
az login
#Create a resource group
az group create --name rg-cicd-demo --location eastus
# Create AKS cluster
az aks create --resource-group rg-cicd-demo --name cicd-aks-cluster-demo --node-count 2 --enable-managed-identity --generate-ssh-keys
# Create ACR (Azure Container Registry)
az acr create --resource-group rg-cicd-demo --name cicdacrmoses2026 --sku Basic
# Create AKS Access to the ACR
az aks update --name cicd-aks-cluster-demo --resource-group rg-cicd-demo --attach-acr cicdacrmoses2026
# Get AKS Credentials 
az aks get-credentials --resource-group rg-cicd-demo --name cicd-aks-cluster-demo

# Create GitHub secrets

# Azure Credentials
az ad sp create-for-rbac  --name "github-actions-aks" --sdk-auth
# ACR Name
# AKS Name
# Resource Group Name

# Define the cicd yaml file