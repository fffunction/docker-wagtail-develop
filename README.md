
Usage:

```sh
docker-compose build
docker-compose up
docker-compose run web python manage.py migrate --noinput
```

The database currently isn't configured correctly so you'll need to set it up like:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'postgres',
        'PORT': '5432',
    }
}
```
