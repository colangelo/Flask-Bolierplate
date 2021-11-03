FROM python:3.10-slim-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt

RUN apt-get update && \
    apt-get install -y --no-install-recommends procps netcat curl vim-tiny && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

# Reference:  https://flask.palletsprojects.com/en/2.0.x/cli/
ENV FLASK_APP=app:app \
    FLASK_ENV=development \
    FLASK_DEBUG=1

EXPOSE 8000

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8000"]
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8000"]
