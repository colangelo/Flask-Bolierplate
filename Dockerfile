FROM python:3.10-slim-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8000"]
