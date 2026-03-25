# Docker Setup for Axionvera Dashboard

This document provides instructions for building and running the Axionvera Dashboard using Docker containers.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

## Build and Run

### Option 1: Using Docker Compose (Recommended for Development)

```bash
# Build and start all services
docker-compose up --build

# Run in detached mode
docker-compose up -d --build

# Stop services
docker-compose down
```

This will start:
- Frontend (Next.js app served by Nginx) on port 80
- Mock backend API on port 3001

### Option 2: Build Docker Image Only

```bash
# Build the Docker image
docker build -t axionvera-dashboard .

# Run the container
docker run -p 80:80 axionvera-dashboard
```

## Multi-Stage Build

The Dockerfile uses a multi-stage build approach:

1. **Builder Stage**: Compiles the Next.js application using Node.js
2. **Dependencies Stage**: Installs only production dependencies
3. **Server Stage**: Uses Nginx to serve the static files

This approach ensures the final image is lightweight and secure.

## Image Size

The final Docker image is optimized to be under 50MB by:
- Using Alpine Linux base images
- Multi-stage builds to exclude build dependencies
- Proper .dockerignore configuration
- Cleaning up npm cache

## Development

### Mock Backend

The mock backend provides sample API endpoints for development:

- `GET /api/health` - Health check
- `GET /api/user` - User information
- `GET /api/balance` - Account balance
- `POST /api/transaction` - Create transaction
- `GET /api/transactions` - Transaction history

### Environment Variables

- `NODE_ENV`: Set to 'production' for optimized builds
- `PORT`: Backend service port (default: 3001)

## Production Deployment

For production deployment:

1. Build the image: `docker build -t axionvera-dashboard:latest .`
2. Run with proper environment variables
3. Consider using a reverse proxy or load balancer
4. Implement proper logging and monitoring

## Troubleshooting

### Common Issues

1. **Port conflicts**: Ensure ports 80 and 3001 are available
2. **Build failures**: Check that all dependencies are in package.json
3. **Permission issues**: May need to run Docker with appropriate permissions

### Logs

```bash
# View Docker Compose logs
docker-compose logs

# View specific service logs
docker-compose logs frontend
docker-compose logs backend
```
