
# Docker file. Сборка образа для backend

FROM maven:3.9.3-eclipse-temurin-20-alpine as builder
ARG VERSION=${VERSION}
WORKDIR /usr/src/app

COPY ./src ./src
COPY *.xml ./

RUN wget -O YandexInternalRootCA.crt https://storage.yandexcloud.net/cloud-certs/CA.pem \
    && mvn package -Dversion.application=${VERSION} -Dmaven.test.skip=true


# Шаг релиза (release stage)
FROM bellsoft/liberica-runtime-container:jre-17-slim-musl
ARG VERSION=${VERSION}
WORKDIR /app

COPY --from=builder /usr/src/app/YandexInternalRootCA.crt .

# Оптимизация Docker-слоёв:
# 1. Создаем директорию для сертификата PostgreSQL и копируем туда сертификат.
# 2. Импортируем сертификат в Java (keytool), затем удаляем временный файл.
# 3. Создаем системную группу и пользователя для запуска приложения.
RUN mkdir -p /home/jaruser/.postgresql \
    && cp YandexInternalRootCA.crt /home/jaruser/.postgresql/root.crt \
    && keytool -importcert -file YandexInternalRootCA.crt \
    -alias yandex -cacerts -storepass changeit -noprompt \
    && rm -rf YandexInternalRootCA.crt \
    && addgroup --system jaruser \
    && adduser -S -s /bin/false -G jaruser jaruser -D -H


COPY --chown=jaruser:jaruser \
    --from=builder /usr/src/app/target/sausage-store-${VERSION}.jar ./sausage-store.jar


EXPOSE 8080

# Запуск приложения от имени пользователя jaruser
USER jaruser
ENTRYPOINT ["java", "-jar", "-Dmyserver.bindPort=8080", "/app/sausage-store.jar"]
