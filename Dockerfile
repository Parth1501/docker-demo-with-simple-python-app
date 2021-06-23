FROM python:2.7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
copy requirements.txt /usr/src/app
run pip install --no-cache-dir -r requirements.txt
copy . /usr/src/app
env PORT 8080
EXPOSE $PORT
VOLUME ["/app-data"]
CMD gunicorn -b :$PORT -c gunicorn.conf.py main:app
