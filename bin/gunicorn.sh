#!/bin/sh

python /project/manage.py collectstatic --noinput
python /project/manage.py migrate --noinput

# https://docs.gunicorn.org/en/stable/settings.html
/usr/local/bin/gunicorn wsgi -w 5 --bind 0.0.0.0:8000 --chdir=/project