# Создание ВМ

## Зависимости

- **Terraform** v1.5.7 или выше
- **Yandex CLI** (для создания токена)

## Краткое описание

Репозиторий создаёт виртуальную машину (ВМ) в Yandex Cloud при помощи двух модулей:

1. `tf-yc-network` – получает данные о сети (зона, подсеть и пр.).
2. `tf-yc-instance` – создаёт ВМ, используя параметры сети.

### Где хранятся ключи и токены?

1. \*_secret.backend.auto.tfvars_

   - Файл с `access_key` и `secret_key` для доступа к хранилищу состояния Terraform (S3-бакет).

2. **secret.provider.auto.tfvars**

   - Хранит `token` (Yandex.Cloud OAuth-токен).

3. **terraform.tfvars**
   - Общие параметры облака (`cloud_id`, `folder_id`, `zone`) и т. д.

Все .tfvars файлы по умолчанию в `.gitignore`, чтобы не заливать конфиденциальные данные в репозиторий.

## Шаги для запуска

1. **Установите Terraform**  
   Убедитесь, что версия Terraform не ниже 1.5.7.

2. **Создайте/обновите файлы для переменных**

   - `secret.backend.auto.tfvars` (для бэкенда):
     ```hcl
     access_key = "YOUR_ACCESS_KEY"
     secret_key = "YOUR_SECRET_KEY"
     ```
   - `secret.provider.auto.tfvars` (для провайдера):
     ```hcl
     token = "YOUR_YANDEX_CLOUD_TOKEN"
     ```
   - `terraform.tfvars` (общие переменные проекта):
     ```hcl
     cloud_id  = ""
     folder_id = ""
     zone      = ""
     ```

3. **Инициализация Terraform**  
   Используйте переименованный файл бэкенда:
   ```bash
   terraform init -backend-config="secret.backend.auto.tfvars"
   ```
