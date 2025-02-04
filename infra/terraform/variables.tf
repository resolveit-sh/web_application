variable "token" {
  description = "Токен для взаимодействия с облаком"
  type        = string
}

variable "cloud_id" {
  description = "ID облака"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}

variable "folder_id" {
  description = "ID каталога в облаке"
  type        = string
  default     = "b1gkv5b0c26ku954njnq"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}


variable "access_key" {
  description = "access_key от сервисного аккаунта для доступа к хранилищу состояния"
  type        = string
}

variable "secret_key" {
  description = "secret_key от сервисного аккаунта для доступа к хранилищу состояния"
  type        = string
}
