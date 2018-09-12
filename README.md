# PHP-SQLSRV 

## Docker image to connect PHP with MSSQL using [**sqlsrv**](https://docs.microsoft.com/en-us/sql/connect/php/microsoft-php-driver-for-sql-server?view=sql-server-linux-2017) driver

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Pre-requisites

- docker-ce
- docker-compose

# Prepare


Create the following directories

```
$ mkdir ~/phpsqlsrv/www
```
```
$ mkdir ~/phpsqlsrv/backup
```

Build compose:

```
$ docker-compose build
```

# Run

Run up compose daemonized
```
$ docker-compose up -d
```

Check containers:
```
$ docker-compose ps

Name                 Command               State                    Ports
---------------------------------------------------------------------------------------------
database    /opt/mssql/bin/sqlservr          Up      0.0.0.0:1433->1433/tcp
webserver   /usr/sbin/apache2ctl -D FO ...   Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

# Access

SSH

* webserver:
    ```
    docker-compose exec webserver bash 
    ```
* database:
    ```
    docker-compose exec database bash 
    ```

# Stop
```
docker-compose down
```
