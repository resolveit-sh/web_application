variable "vm_name" {
  description = "Название ВМ"
  type        = string
  default     = "chapter5-lesson2-std-035-53"
}

variable "platform_id" {
  description = "Платформа"
  type        = string
  default     = "standard-v1"
}

variable "image_id" {
  description = "ОС"
  type        = string
  default     = "fd8fb6pa1asvq7a6mkdt"
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
  default     = "default-ru-central1-a"
}

variable "network_zone" {
  description = "network_zone"
  type        = string
}
