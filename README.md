# PHP-SQLSRV 

Docker image to connect PHP with MSSQL using **sqlsrv** driver

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Pre-requisites

- docker-ce
- docker-compose

### Building


```
docker build .
```

### Build with tagname
```
docker build -t marcelodeandrade/php-sqlsrv .
```
### Use `--no-cache` flag to rebuild
```
docker build -t marcelodeandrade/php-sqlsrv . --no-cache
```

## Running

### Composing with Dockerfile
```
docker-compose -f docker-compose.yml up
```

### To run up rebuilding a Dockerfile
```
docker-compose -f docker-compose.yml up --build
```

### Run an image in a new container daemonized
```
docker run -d -p 80:80 <container>
```

### SSH access container
```
sudo docker run -i -t <container_name> /bin/bash 
```

### Stoping container
```
sudo docker stop <container_id>
```

## Authors

* **Marcelo de Andrade** [@marcelodeandrade](https://github.com/marcelodeandrade)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## TODO

* 
