FROM python:3.11

WORKDIR /

COPY "requirements.txt" "requirements.txt"

RUN ["pip3", "install", "-r","requirements.txt"]

RUN ["pip3", "install", "gunicorn", "boto3"]

WORKDIR /space-odyssey

COPY . .

CMD gunicorn wsgi:app \
    --timeout 600 \
    --bind 0.0.0.0:80 \
    --workers 5 

EXPOSE 80