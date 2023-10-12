# arsentievvit_microservices
arsentievvit microservices repository

# ДЗ 12

# Основная часть

Опробован docker
Создан контейнер приложения reddit
Развёрнут docker-host с помощью deprecated docker-machine
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
