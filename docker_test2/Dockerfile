FROM python:3.8.10-slim
WORKDIR /usr/src/app

COPY . .
EXPOSE 8000
RUN apt install python3.8-venv
RUN python3 -m venv ./.venv
RUN source ./.venv/bin/activate
RUN pip install -U pip
RUN pip install -r requirements.txt
RUN python manage.py migrate
CMD python manage.py runserver 0.0.0.0:8000
