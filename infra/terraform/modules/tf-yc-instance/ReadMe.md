# Создание виртуальной машина

Провайдер: `yandex-cloud/yandex`

## Зависимости
Модуль зависит от модуля tf-yc-network, а именно из tf-yc-network заполняются переменные:
1. network_zone;
2. subnet_id (по умолчанию `default-ru-central1-a`);

## Параметры

В параметрах можно задать:

1. vm_name - имя виртуальной машины 
2. platform_id - платформа. Список возможных платформ можно посмотрет [тут](https://cloud.yandex.ru/ru/docs/compute/concepts/vm-platforms) 
3. image_id - идентификатор образа ОС. По умолчанию используется `fd80qm01ah03dkqb14lc` 
   (ubuntu-20-04-lts-vgpu-v20211027 ). Как получить возможные образы можно узнать [тут](https://cloud.yandex.ru/ru/docs/compute/operations/images-with-pre-installed-software/get-list#cli_1)
4. subnet_id - идентификатор подсети. Берется из `output "subnet_id"` модуля tf-yc-network.
5. network_zone - зона доступности. Берется из `output "network_zone"` модуля tf-yc-network.

## Вывод модуля

Модуль возвращает 2 переменные:
1. ip_address_global - IP адрес для доступа к ВМ из вне;
2. ip_address_local - локальный IP адрес