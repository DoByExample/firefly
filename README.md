
Firefly is an elegant solution for personal media hosting and URL
shortening. Firefly 2 is a complete rewrite of the original project.

# Getting started

Firefly is a modern ruby web application. The following you 
will need:

 * Docker

## Get Firefly 2

    git clone https://github.com/DoByExample/firefly.git
    cd firefly


## Run Firefly
```
docker-compose up -d
```

This will start hanami in development mode, using a local Sqlite 
database for storage. It will also start a Sidekiq worker for
asynchronously processing data (like links and images).
    
Open [http://localhost:2300/admin](http://localhost:2300/admin) 
and sign in with the development credentials: `admin` / `admin`.

# Running tests

Firefly 2 is fully tested using Minitest. Running tests should 
alwasy be easy and straightforward:

    docker-compose run --rm -e HANAMI_ENV=test web bash -c 'hanami db prepare; rake test'

# Contributors

This project was written by [Ariejan de Vroom](https://ariejan.net) and [a cool gang of contributors](https://github.com/ariejan/firefly/graphs/contributors)

# License

This project is licensed under the [MIT Licence](https://github.com/ariejan/firefly/blob/master/LICENSE.md).
