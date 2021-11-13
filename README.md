# Решение [домашнего задания](https://github.com/netology-code/py-homeworks-web/tree/new/1.3-docker) к лекции «Docker»

## Задача 1
1. Приложены файлы [Dockerfile]() и [index.html]()
1. Для сборки образа:   
    - запустить терминал в папке со скачанными файлами
    - выполнить команду `docker build -t new_nginx .`
1. Запустить контейнер командой `docker run  -d name=my_nginx new_nginx`
1. Также образ был загружен на [dockerhub](hhttps://hub.docker.com/r/headsoft/netology_homework/tags). Нейминг пполучился некорректный, но в сути разобрался.   
Скачать и запустить можно выполнив команды:   
`docker pull headsoft/netology_homework:new_nginx_latest`  
`docker run -d name=my_nginx headsoft/netology_homework` 
1. По адресу  http://localhost:80 открывается страница "nginx docker test" с  надписью Hello World!
  
## Задача 2


Создайте контейнер для REST API сервера любого вашего проекта из курса по Django (например, CRUD: Склады и запасы).

ВАЖНО: поменяйте БД с postgresql на sqlite3. Чтобы ваш контейнер мог работать без зависимости от postgres (с этим мы разберемся на следующем занятии).

Проверьте конфигурацию Django на использование переменных окружения (environment).

Приложите в репозиторий Dockerfile и файлы приложения.
В README.md описать типовые команды для запуска контейнера c backend-сервером.
Для проверки работоспособности вашего контейнера отправляйте запросы с помощью VS Code REST Client или Postman.