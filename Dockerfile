# Use the official Python 3.9 image as the base image
FROM python:3.9-slim

# Create a directory for your application
WORKDIR /app

RUN --mount=type=secret,id=api_key,dst=/app/api_key.txt \
    echo "API_KEY=$(cat /app/api_key.txt)" > .env
# Your application code and instructions can follow below
# For example, install dependencies or copy your application files

# RUN pip install -r requirements.txt
RUN pip install --upgrade pip
RUN pip install python-dotenv
COPY ./app /app

CMD ["python", "main.py"]
