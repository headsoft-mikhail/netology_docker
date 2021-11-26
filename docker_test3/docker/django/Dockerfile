FROM python:3.8.10-slim
WORKDIR /usr/src/app

EXPOSE 8000
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# RUN python3 -m venv .venv && . .venv/bin/activate
COPY requirements.txt .
RUN ["pip", "install", "-U", "pip"]
RUN ["pip", "install", "-r", "requirements.txt"]
RUN ["pip", "install", "psycopg2-binary==2.9.2", "gunicorn==20.1.0"]

COPY . .
# RUN ["python", "manage.py", "migrate"]
# CMD ["gunicorn", "stocks_products.wsgi", "-w", "4", "-b", "0.0.0.0:8000"]
CMD ["sh", "./start.sh"]
