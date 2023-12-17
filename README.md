# arsentievvit_microservices
arsentievvit microservices repository

# ДЗ 18

## Основная часть

 - сервис EFK собран с помощью docker compose
 - обновлён Dockerfile и fluent.conf
 - собран образ fluentd
 - для сбора логов с сервисов приложения прописан logging драйвер в docker-compose.yml
 - для сервиса post в конфиге fluentd прописан фильтр для сбора структурированных логов в формате json
 - для сервиса ui прописаны фильтры для сбора неструктурированных логов
 - поднят zipkin для ознакомления с метриками

 ## Дополнительная часть

 - с помощью https://grokdebugger.com/ удалось написать правильный паттерн для сбора неструктурированного лога из допзадания.

# ДЗ 17

## Основная часть

- установил Prometheus в docker
- сконфигурировал таргеты сбора метрик в конфигурационном файле
- обновил docker-compose.yml для поднятия контейнеров приложения и prometheus
- проверил метрики при выключении части контейнеров приложения
- добавил node exporter в docker-compose.yml, перезапустил, проверил метрики

Репозиторий docker hub - https://hub.docker.com/repositories/varsentiev

# ДЗ 16

## Основная часть

- выполнена установка gitlab-ci на инстанс
- проведена начальная настройка
- создана группа и проект внутри неё
- настроен раннер
- в файле **.gitlab-ci.yml** описан пайплайн
- протестировано создание окружений, в том числе динамическое

# ДЗ 15

## Основная часть

- ознакомился с разными типами сетей в Docker
- проверил на практике размещение контейнеров приложения в разных сетях
- опробовал инструмент docker-compose для описания сервиса из разных контейнеров

## Дополнительная часть

-  **command: "ruby --debug -w 2"** внутри описания контейнера позволит запустить команду с необходимыми параметрами
-  получить доступ из хостовой машины к коду внутри контейнера можно забиндив директорию хоста с кодом к директории приложения (полезно для локальной разработки)

# ДЗ 14

## Основная часть

 - Склонирован [архив](https://github.com/express42/reddit/archive/microservices.zip) и распакован в директорию **src** в корне репозитория.
 - Внутри **src** директориях _post_py_, _ui_, _comment_ созданы Dockerfile, описывающие создание образов для docker.
 - Использован _hadolint_, для оптимизации Dockerfile.
 - Собраны базовые образы из ДЗ (после плясок с бубном).
 - Оригинальные Dockerfile, с учётом _hadolint_, имеют "расширение" в виде цифры в конце.
 - Создан бридж **reddit**, с возможностью разрешать хосты в пределах сети.
 - Запуск команд **docker run -d ...** из презентации разворачивает приложение, доступное по адресу **$IP:9292**.

## Дополнительная часть

 - Контейнеры запущены с другими сетевыми именами, используя **--env FOO='bar'** при запуске контейнеров. На работу приложения не влияет.
 - С помощью оптимизации и использования базового образа Alpine удалось снизить размер каждого сервиса до, примерно, 40Мб. Результаты описаны в _Dockerfile_.
 - Создан volume **reddit_db**, который монтируется при запуске из образа **mongodb**. После удаления контейнера и пересоздании, данные остаются и приложение работает нормально.


# ДЗ 13

# Основная часть

Опробован docker \
Создан контейнер приложения reddit \
Развёрнут docker-host с помощью deprecated docker-machine \
Образ запушен на docker hub и проверен локально

## Дополнительная часть

Создана инфраструктурная часть кода (пример для 2 инстансов):
```bash
TF_VAR_instance_count=2 terraform plan
TF_VAR_instance_count=2 terraform apply
```

Созданы два плейбука:
```bash
# Сделал со статическим инвентарём
ansible-playbook docker_install.yml # Подготовка докер хоста
ansible-playbook docker_image.yml   # Развёртывание контейнера
```

Создан файл создания образа через packer:
```bash
# Создание образа
packer build --var-file variables.pkrvars.hcl .
```
