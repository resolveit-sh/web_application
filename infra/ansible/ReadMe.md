# Запуск

![Результат выполнения скрипта](script_result.png)

## Настройка перед запуском

### Настройка подключения к Nexus

Ansible скачивает артефакты приложения из Nexus.
Адрес Nexus задаётся в переменной `nexus_url` (файл `ansible/group_vars/all.yml`).

Для авторизации в Nexus нужно объявить переменные:

1. `nexus_login`
2. `nexus_password`

Переменные уже есть в файле `ansible/nexus_access_data.yml` в зашифрованном виде.

С помощью переменных:

1. `nexus_backend_repository_path`
2. `nexus_frontend_repository_path`

Можно управлять расположение репозитория в Nexus.

### Указание версий

Версия бэкенда указывается в переменной: `backend_maven_version`
Версия фронтенда указывается в переменной: `frontend_version`

### Задать IP адрес ВМ к которой будет подключаться ansible

Перед тем, как запускать ansible-playbook, необходимо выяснить IP-адрес ВМ на которой будет работать приложение.
IP адрес должен быть задать в `ansible/inventory.yaml`.

## Запуск

ansible-playbook playbook.yaml -e "@nexus_access_data.yml" --vault-password-file=vault_password
