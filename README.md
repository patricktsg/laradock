## Laradock PDG

### How to start

* Clone all the projects in the same folder as Laradock
* Clone the env-example-local file into .env
* Go to nginx/sites/local and create all the necessary hosts in your local to map the ones you find in there
* If DBs haven't been created, run Laradock and execute the following command `docker-compose exec mysql bash`
* Finally execute this other command to create the DBs `mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql`
* You can connect to Laradock DBs using MySQL WorkBench, SequelPro or similar using the following details (all details are in `.env` as well):
    * Host: 127.0.0.1
    * Port: 3406
    * User: default
    * Password: secret
* Get into the workspace container using `docker-compose exec workspace bash`
* Go to each of the projects and execute `composer install`, migrations, etc... remember that you need to set up the projects within the container NOT your local!

#### Running your local environment

```
docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d mysql nginx
```

If you are facing any problems, put down docker (`docker-compose down`) and put it up again without `-d` (`...ride.yml up mysql...`) and you'll see the entire output and maybe identify the issue.
To access docker instance where all projects are, execute `docker-compose exec workspace bash` and list everything in that folder ;)
If you need to create a new DB open `mysql/docker-entrypoint-initdb.d/createdb.sql.example` and check the documentation at the top of the file. In there explains how to access the MySQL container and below you have the commands to create DBs and GRANT permissions.

#### Staging environment:

```
docker-compose -f docker-compose.yml -f docker-compose.staging.yml up -d mysql caddy
```

#### Production environment:

```
docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d mysql caddy
```

The MySQL service is not accesible from remote machines.

--

As you can see the staging and production environment use Caddy instead of Nginx. This is for make easy the SSL certifacate auto-update process. (Recommended by Laradock)
