variable "location" {
  type    = string
  default = "swedencentral"
}

variable "prefix" {
  type    = string
  default = "tfdevops"
}

variable "acr_name" {
  type        = string
  description = "Lowercase letters and numbers only, globally unique"
  default     = "ktashiqacr02"
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}
