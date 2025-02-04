#!/usr/bin/env bash

# скрипт для деплоя frontend без использования докера
set -xeuo pipefail

echo "Downloading and unpacking Frontend version ${VERSION}"

#скачать
sudo -u frontend curl -v -u "${NEXUS_REPO_USER}:${NEXUS_REPO_PASS}" \
  -o /opt/sausage-store/static/dist/sausage-store-${VERSION}.tar.gz \
  "${NEXUS_REPO_URL}/${NEXUS_REPO_FRONTEND_NAME}/${VERSION}/sausage-store-${VERSION}.tar.gz"

#распаковать
cd /opt/sausage-store/static/dist
sudo -u frontend tar -xvf sausage-store-${VERSION}.tar.gz
sudo -u frontend rm -f sausage-store-${VERSION}.tar.gz

# ребут nginx
sudo systemctl reload nginx

