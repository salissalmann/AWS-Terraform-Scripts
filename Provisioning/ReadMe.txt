What are provisioners in terraform?
Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction.
Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.
Provisioners are only run when a resource is created during apply. They are not run during update or any other lifecycle.
Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.

Types of Provisioners
There are two types of provisioners:
1- Local-exec Provisioner: 
   The local-exec provisioner invokes a local executable after a resource is created. This invokes a process on the machine running Terraform, not on the resource.
2- Remote-exec Provisioner
   The remote-exec provisioner invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc.


More Provisioners
There are many more provisioners available in terraform, some of them are:
1- Chef Provisioner
2- Ansible Provisioner


//Generate SSH Keys
-> cd to your project directory
-> ssh-keygen -t rsa -b 4096 -f terraform-key -N ""      //Generates ssh key without user input
-> chmod 400 terraform-key
-> ls -l
-> Write provider.tf file
-> write variables.tf file
-> write some bash script file to be executed on remote machine by terraform provisioner  
-> write instance.tf file
-> terraform init
-> terraform apply -auto-approve
-> terraform destroy

