# Day 10
- Simulated real-world failures in a multi-service Docker Compose setup.
- Debugged issues related to startup order, environment variables, and port mappings.
- Identified root causes using logs, environment inspection, and service status.
- Understood impact of volume misconfiguration on data persistence.

Important Debugging commands.

docker compose ps
docker logs <service>
docker exec <service> env
docker inspect <service>
