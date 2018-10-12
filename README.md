# PHP-SQLSRV 

## Docker image to connect PHP with MSSQL using [**sqlsrv**](https://docs.microsoft.com/en-us/sql/connect/php/microsoft-php-driver-for-sql-server?view=sql-server-linux-2017) driver

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Pre-requisites

- docker-ce

# Prepare

Build:

```
$ docker build .
```

# Run

Run up daemonized
```
docker run -d m91x/phpsqlrv
```

Check containers:
```
$ docker ps

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS       NAMES
0d149516d3ec        m91x/phpsqlrv       "/usr/sbin/apache2ct…"   7 seconds ago       Up 4 seconds        80/tcp       reverent_visvesvaraya
```

# Access

SSH

```
docker-compose exec -i -t CONTAINER_ID bash 
```

# Stop
```
docker stop CONTAINER_ID 
```
