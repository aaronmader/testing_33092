FROM python:3.10
ENV PYTHONUNBUFFERED=1

# These dependencies run without any errors:
# RUN pip install django==4.1.0 pymemcache==3.5.2 uWSGI==2.0.20

# These dependencies experience errors:
RUN pip install django==4.0.7 pymemcache==3.5.2 uWSGI==2.0.20


WORKDIR /code/
RUN django-admin startproject project .

COPY project/ project/
RUN cat project/settings_additions.py >> project/settings.py

# Run UWSGI
EXPOSE 8000
ENV UWSGI_WSGI_FILE=project/wsgi.py UWSGI_HTTP=:8000 UWSGI_MASTER=1 UWSGI_WORKERS=1 UWSGI_THREADS=10 UWSGI_UID=www-data UWSGI_GID=www-data UWSGI_LAZY_APPS=1 UWSGI_WSGI_ENV_BEHAVIOR=holy UWSGI_RELOAD_ON_RSS=100

CMD ["uwsgi", "--http-auto-chunked", "--http-keepalive"]
