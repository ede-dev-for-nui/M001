# PostgreSQL Docker Installation Documentation

## Quick Start Guide
1. **Install Docker:** Ensure you have Docker installed on your machine. Follow the [official installation guide](https://docs.docker.com/get-docker/).
2. **Pull the PostgreSQL Docker Image:**
   ```bash
   docker pull postgres:latest
   ```
3. **Run PostgreSQL Container:**
   ```bash
   docker run --name postgres-container -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
   ```
4. **Access PostgreSQL:** Connect using a database tool or via the command line:
   ```bash
   docker exec -it postgres-container psql -U postgres
   ```

## Configuration
- To configure the PostgreSQL instance, use environment variables when running the container. Common options include:
  - `POSTGRES_DB`: Name of a database to create when the container starts.
  - `POSTGRES_USER`: Username for the default database user.
  - `POSTGRES_PASSWORD`: Password for the default database user.

Example:
```bash
docker run --name postgres-container -e POSTGRES_DB=mydb -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
```

## Useful Commands
- **List running containers:**  
  ```bash
  docker ps
  ```  
- **Stop a container:**  
  ```bash
  docker stop postgres-container
  ```  
- **Start a container:**  
  ```bash
  docker start postgres-container
  ```  
- **Remove a container:**  
  ```bash
  docker rm postgres-container
  ```  
- **Access the PostgreSQL shell:**  
  ```bash
  docker exec -it postgres-container psql -U postgres
  ```  

## Troubleshooting
- **Container won't start:** Check logs for errors:
  ```bash
  docker logs postgres-container
  ```
- **Access denied errors:** Ensure that you are using the correct username and password.
- **Port conflicts:** Ensure no other service is using port 5432.

## Security Best Practices
1. **Use Strong Passwords:** Always set a strong password for the database user.
2. **Limit Network Exposure:** Bind the PostgreSQL container to localhost if only local access is needed.
   ```bash
   docker run --name postgres-container -e POSTGRES_PASSWORD=mysecretpassword -d -p 127.0.0.1:5432:5432 postgres
   ```
3. **Use Docker Volumes:** Store persistent data by using Docker volumes:
   ```bash
   docker run --name postgres-container -e POSTGRES_PASSWORD=mysecretpassword -v pgdata:/var/lib/postgresql/data -d postgres
   ```
4. **Regular Backups:** Implement a backup strategy to keep your data safe.

For more information, consult the [PostgreSQL Docker documentation](https://hub.docker.com/_/postgres).