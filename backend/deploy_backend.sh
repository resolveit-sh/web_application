# Скрипт для деплоя исходников без докера

#!/usr/bin/env bash
set -xeuo pipefail

echo "Downloading and configuring Backend version ${VERSION}"

# Создаём директорию, если её нет (это необходимо, чтобы curl смог сохранить файл)
sudo mkdir -p /opt/sausage-store/bin

# Качаем JAR из Nexus
sudo -E -u backend curl -v -u "${NEXUS_REPO_USER}:${NEXUS_REPO_PASS}" -f \
  -o "/opt/sausage-store/bin/sausage-store-${VERSION}.jar" \
  "${NEXUS_REPO_URL}/${NEXUS_REPO_BACKEND_NAME}/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar"

# Проверка загрузки
if [ ! -f "/opt/sausage-store/bin/sausage-store-${VERSION}.jar" ]; then
  echo "Ошибка: Файл sausage-store-${VERSION}.jar не был скачан."
  exit 1
fi

# Создаём или обновляем символическую ссылку
sudo -E -u backend ln -vfns "/opt/sausage-store/bin/sausage-store-${VERSION}.jar" /opt/sausage-store/bin/sausage-store-backend.jar

# Перемещаем файл сервиса в системную директорию systemd
sudo mv "/home/${DEV_USER}/sausage-store-backend.service" /etc/systemd/system/sausage-store-backend.service

# Перезагружаем конфигурацию systemd и перезапускаем сервис
sudo systemctl daemon-reload
sudo systemctl restart sausage-store-backend
sudo systemctl enable sausage-store-backend
