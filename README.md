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
    
      
       
# Решение [домашнего задания](https://github.com/netology-code/py-homeworks-web/blob/new/1.4-docker-compose/README.md) к лекции Docker Compose

Решить задачу до конца не получилось, есть много вопросов, которые в чате не решить. 

## Что сделано:
1. Отредактирован файл [settings.py](): БД изменена с sqlite3 на postgresql, также параметры такие как ALLOWED_HOSTS, DEBUG, SECRET_KEY и др. получаются с помощью os.getenv("NAME") для того, чтобы задавать их через .env-файл
1. Создан файл [docker-compose.yml](), в котором описаны services(django, postgres, nginx), networks, volumes.
1. Создан [Dockerfile для nginx]() 
1. Создан [Dockerfile для django]()
1. Созданы файлы с перечислением переменных среды: [django.env]() и [postgres.env]() 

## Возникшие проблемы:
1. При сборке создается большое количество образов и контейнеров, которые так и остаются висеть в системе. Это нормально? Или это из-за того что у меня собирается с ошибкой?  
Сейчас для очистки всех контейнеров и образов использую [clear_docker.sh]()

![скриншот](https://disk.yandex.ru/i/h4wHEESSRjmJeg "")
1. Нужно ли обращать внимание на предупреждение  
`WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
` ?

1. Такое впечатление, что переменные среды из .env-файлов не подгружаются:  
![скриншот](https://disk.yandex.ru/i/iArpViinZyw5SQ "")  
Если закомментировать строчку с миграциями в Dockerfile, то сборка завершается, но gunicorn сразу после запуска завершает работу:  
![скриншот](https://disk.yandex.ru/i/FhSerlXqw9NAYg "")

1. Nginx также после сборки и запуска сразу завершает работу:  
![скриншот](https://disk.yandex.ru/i/vmq4zEfzTdMmYQ "")
Похоже, что в nginx.conf что-то не так

1. Posgres запускается, правда не на том порту:  
![скриншот](https://disk.yandex.ru/i/Y3mwyMNKPqRs9Q "")  
У меня в postgres.env указан 5433, а postgres подключился 5432.   
А при попытке запуска на 5432   
(если указываю в postgres.env   
`POSTGRES_PORT=5432`,  
и в docker-compose.yml для postgres-service  
`ports: - 5432:5432`)   
во время `Container postgres  Starting` получаю сообщение что порт занят:  
`Error response from daemon: driver failed programming external connectivity on endpoint postgres (8ce53dee189422c84c53ce80fec29fcda464e996da6998f4cd3b6aab716287fc): Error starting userland proxy: listen tcp4 0.0.0.0:5432: bind: address already in use`

1. Пробовал указывать переменные среды прямо в docker-compose.yml через `environment:`, результат такой же