This project is an effort to isolate django issue: https://code.djangoproject.com/ticket/33092

## Usage:

```
docker-compose build
docker-compose up -d server memcached
docker-compose run --rm client
docker-compose logs server | grep -v "(HTTP/1.1 200)"
```

## Observations:

- It sure looks like a threading bug to me.
- It does not appear to occur on django 4.1.0
