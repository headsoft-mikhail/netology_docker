# Решение [домашнего задания](https://github.com/netology-code/py-homeworks-web/tree/new/1.3-docker) к лекции «Docker»

## Задача 1 / docker_test1
1. Приложены файлы [Dockerfile](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test1/Dockerfile) и [index.html](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test1/index.html)
1. Для сборки образа:   
    - запустить терминал в папке со скачанными файлами
    - выполнить команду `docker build -t new_nginx .`
1. Запустить контейнер командой `docker run  -d name=my_nginx new_nginx`
1. Также образ был загружен на [dockerhub](hhttps://hub.docker.com/r/headsoft/netology_homework/tags). Нейминг пполучился некорректный, но в сути разобрался.   
Скачать и запустить можно выполнив команды:   
`docker pull headsoft/netology_homework:new_nginx_latest`  
`docker run -d name=my_nginx headsoft/netology_homework` 
1. По адресу  http://localhost:80 открывается страница "nginx docker test" с  надписью Hello World!
  
## Задача 2 / docker_test2
1. В [settings.py](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test2/stocks_products/settings.py) в ALLOWED_HOSTS записаны "localhost", "127.0.0.1", а также внесены изменения в DATABASES для работы с sqlite3
1. Обновлен файл [requirements.txt](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test2/requirements.txt): `pip freeze>requirements.txt`
1. Создан файл [Dockerfile](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test2/Dockerfile)
1. Создан файл [.dockerignore](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test2/.dockerignore), в котором указаны файлы, которые не нужно копировать в образ
1. Для того чтобы создать контейнер для REST API сервера нужно выполнить команду (из директории проекта): 
`docker build -t django_project .`   
1. Для запуска контейнера нужно выполнить команду:   
`run --name=django_test -d -p 8000:8000 django_project`
1. Для проверки работоспособности  можно получить список продуктов (GET-запрос) здесь: http://localhost:8000/api/v1/products/, Или отправить запрос из файла [requests-examples.http](https://github.com/headsoft-mikhail/netology_docker/blob/master/docker_test2/requests-examples.http).
  
