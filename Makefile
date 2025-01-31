DC := $(shell which docker-compose)


all: install


install: $(DC)
	docker-compose build

runserver: $(DC)
	docker-compose run --rm -p 8000:8000 django python ./manage.py runserver 0.0.0.0:8000

migrate: $(DC)
	docker-compose run --rm django python ./manage.py migrate

superuser: $(DC)
	docker-compose run --rm django python ./manage.py createsuperuser

test: $(DC)
	docker-compose run --rm django py.test

shell:
	 docker-compose run --rm django python ./manage.py shell

backup:
	docker-compose exec db pg_dump -U postgres -d postgres -f ./backups/`date +%Y-%m-%d_%H:%M:%S`.sql

app:
	mkdir apps/$(name)
	docker-compose run --rm django python manage.py startapp $(name) apps/$(name)
