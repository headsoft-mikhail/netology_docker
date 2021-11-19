FROM python:3.8.10-slim
WORKDIR /usr/src/app
COPY . .

EXPOSE 8000
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN ["pip", "install", "-U", "pip"]

RUN ["pip", "install", "-r", "requirements.txt"]
RUN ["pip", "install", "psycopg2-binary==2.9.2"]
RUN ["pip", "install", "gunicorn"]

RUN ["python", "manage.py", "migrate"]

CMD ["gunicorn", "main.wsgi", "-b", "0.0.0.0:8000", "-w", "5"]
