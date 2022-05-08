variable "resource_group_name" {
  default = "RG-NSG-WEBFARM"
}

variable "location" {
  default = "australiacentral"
}

variable "tags" {
  type = map
  default = {
    WorkloadName       = "Training"
    DataClassification = "Non-business"
    Criticality        = "Low"
    BusinessUnit       = "Shared"
    OpsCommitment      = "Baseline only"
    OpsTeam            = "NetEng"
    Project            = "VNETS"
    Author             = "Aaron"
  }
}