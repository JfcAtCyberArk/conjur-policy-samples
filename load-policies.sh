#! /bin/bash

conjur authn login

# 0 Root
conjur policy load root root.yml

# 1 System and Teams
conjur policy load conjur conjur.yml
conjur policy load conjur/authn-k8s/openshift conjur/authn-k8s-openshift.yml
conjur policy load devops-alpha devops-alpha.yml
conjur policy load devops-beta devops-beta.yml

# 2 Environments
conjur policy load devops-alpha/dev devops-alpha/dev.yml
conjur policy load devops-alpha/prod devops-alpha/prod.yml
conjur policy load devops-beta/dev devops-beta/dev.yml
conjur policy load devops-beta/prod devops-beta/prod.yml

# 3 Application and Tools
#conjur policy load devops-alpha/dev/aws devops-alpha/dev/aws.yml 
conjur policy load devops-alpha/dev/jenkins devops-alpha/dev/jenkins.yml
conjur policy load devops-alpha/dev/ansible devops-alpha/dev/ansible.yml
conjur policy load devops-alpha/dev/first-app devops-alpha/dev/first-app.yml

#conjur policy load devops-alpha/prod/aws devops-alpha/prod/aws.yml
#conjur policy load devops-alpha/prod/jenkins devops-alpha/prod/jenkins.yml
#conjur policy load devops-alpha/prod/ansible devops-alpha/prod/ansible.yml
#conjur policy load devops-alpha/prod/first-app devops-alpha/prod/first-app.yml


conjur policy load devops-beta/dev/openshift devops-beta/dev/openshift.yml
#conjur policy load devops-beta/dev/jenkins devops-beta/dev/jenkins.yml
conjur policy load devops-beta/dev/terraform devops-beta/dev/terraform.yml
conjur policy load devops-beta/dev/terraform/secrets devops-beta/dev/terraform/secrets.yml
conjur policy load devops-beta/dev/terraform/deployment-A devops-beta/dev/terraform/deployment-A.yml
conjur policy load devops-beta/dev/terraform devops-beta/dev/terraform/permits.yml
conjur policy load devops-beta/dev/second-app devops-beta/dev/second-app.yml 

#conjur policy load devops-beta/prod/openshift devops-beta/prod/openshift.yml
#conjur policy load devops-beta/prod/jenkins devops-beta/prod/jenkins.yml
#conjur policy load devops-beta/prod/second-app devops-beta/prod/second-app.yml

# 4 Entitlements
conjur policy load root entitlements.yml
 
