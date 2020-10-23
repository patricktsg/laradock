## Laradock PDG

### How to start

* Clone the social-accounts and media projects in the same path of the laradock
* Create the .env from one of the env-example files. Choose the environment.
* You should change the database default user and root user passwords in the .env file
* ONLY IN LOCAL or STAGING: To recreate the database and users remove the folder ~/.laradock/data/mysql rebuild and restart the mysql.

#### Local environment:

```
docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d mysql nginx
```

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
