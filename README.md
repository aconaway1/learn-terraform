I am trying to learn Terraform to help do Azure deployments. These are my labs that I'm using to learn new things and polish up configs.

To fire up a new lab, copy the "template-infra" directory to a new one. This gives us a good starting point.

* One RG
* Three VNets
* One VHub connecting them all
* Each VNet has one subnet
* Each subnet has one VNIC
* Each VNIC has a Linux VM attached