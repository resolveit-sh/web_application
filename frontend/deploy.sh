#! /bin/bash

# Логинимся в Docker Registry
# Создаём сеть для связки frontend и backend
# Удаляем контейнер, если существует
# Запускаем контейнер с фронтом из Docker Registry на 80м порту

set -xe

# Если переменная CI_PROJECT_DIR не задана, задаем её вручную:
export CI_PROJECT_DIR="builds/std-035-53/sausage-store"

# Вывод для проверки
echo "Монтируемый файл: /opt/${CI_PROJECT_DIR}/frontend/default.conf"

# Логинимся в Docker Registry
sudo docker login -u "${CI_REGISTRY_USER}" -p"${CI_REGISTRY_PASSWORD}" "${CI_REGISTRY}"

# Создаем сеть, если не существует
sudo docker network create -d bridge sausage_network || true

# Удаляем старый контейнер
sudo docker rm -f sausage-frontend || true

# Запускаем контейнер, монтируя конфигурацию из постоянного каталога /opt
sudo docker run -d --name sausage-frontend \
     -p 80:80 \
     -v /opt/${CI_PROJECT_DIR}/frontend/default.conf:/etc/nginx/conf.d/default.conf \
     --network=sausage_network \
     --restart=always \
     "${CI_REGISTRY_IMAGE}/sausage-frontend:latest"
