terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }

  backend "s3" {
    bucket                      = "terraform-state-std-035-53"
    key                         = "terraform.tfstate"
    region                      = "ru-central1"
    endpoint                    = "https://storage.yandexcloud.net" # Use this instead of endpoints block
    access_key                  = "INSERT_DATA"
    secret_key                  = "INSERT_DATA"
    force_path_style            = true
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
