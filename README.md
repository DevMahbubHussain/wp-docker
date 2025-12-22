# wp-docker

### Start the application

```
docker compose up
```
### Run in background
```
docker compose up -d
```
### Stop containers
```
docker compose down
```

### List images & 
```
docker images
docker rmi myname/wordpress-dev:1.0
```

### Stop and remove volumes (⚠️ deletes database):

```
docker compose down -v
```

### Rebuild images & Rebuild and start

```
docker compose build
docker compose up --build
```

### View logs & Follow logs live & Specific service:
```
docker compose logs
docker compose logs -f
docker compose logs wordpress
```

### Enter a container
```
docker compose exec wordpress bash
```

### MySQL shell
```
docker compose exec db mysql -uwordpress -p
```

### List containers
```
docker compose ps
```

### Clean unused Docker resources
```
docker system prune
```

### Access URLs
```
| Service    | URL                                            |
| ---------- | ---------------------------------------------- |
| WordPress  | [http://localhost:8000](http://localhost:8000) |
| phpMyAdmin | [http://localhost:8080](http://localhost:8080) |
```


### Build Docker Image (from Dockerfile) & Build for latest tag too

```
docker build -t myname/wordpress-dev:1.0 .
docker tag myname/wordpress-dev:1.0 myname/wordpress-dev:latest
```

### Login to Docker Registry (Docker Hub)
```
docker login
prompted for
Docker Hub username
Password or access token
```

### Push Image to Docker Registry (Docker Hub)
```
docker push myname/wordpress-dev:1.0
docker push myname/wordpress-dev:latest
```


### Test locally (Mac & Windows)
```
docker compose exec wordpress node -v
docker compose exec wordpress npm -v
docker compose exec wordpress wp --info
docker compose exec wordpress composer --version
```

### Install deps once && Run dev server
docker compose exec wordpress npm install
docker compose exec wordpress npm run dev

