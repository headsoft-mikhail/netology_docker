FROM python:3.8.10-slim
WORKDIR /usr/src/app
COPY . .

EXPOSE 8000
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# CMD python3 -m venv venv
# CMD source venv/bin/activate

CMD ["pip", "install", "-U", "pip"]
CMD ["pip", "install", "-r", "requirements.txt"]
CMD ["pip", "install", "psycopg2-binary==2.9.2"]
CMD ["pip", "install", "gunicorn==20.1.0"]
CMD ["python", "manage.py", "migrate"]

# CMD ["gunicorn", "-w", "5", "-b", "0.0.0.0:8000", "stocks_products.wsgi"]
CMD gunicorn stocks_products.wsgi -b 0.0.0.0:8000 --workers=5
# CMD python manage.py runserver 0.0.0.0:8000
