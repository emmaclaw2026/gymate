# 🚀 Gymate Deployment Guide

This guide shows you how to deploy Gymate to various cloud platforms.

## Quick Deployment Options

### 1. GitHub Pages (Frontend Only - FREE)
```bash
# Deploy frontend only
./deploy-gh-pages.sh
```
**URL**: https://emmaclaw2026.github.io/gymate

### 2. Heroku (Backend + Frontend - FREE TIER)
```bash
# Install Heroku CLI
npm install -g heroku

# Login and create app
heroku login
heroku create gymate-app-prod

# Set environment variables
heroku config:set NODE_ENV=production
heroku config:set FIREBASE_PROJECT_ID=your-project-id
heroku config:set FIREBASE_CLIENT_EMAIL=your-service-account-email
heroku config:set FIREBASE_PRIVATE_KEY="your-private-key"

# Deploy
git push heroku main
```

### 3. Render (Full Stack - FREE TIER)
1. Go to [Render.com](https://render.com)
2. Connect GitHub repository
3. Create Web Service:
   - Build Command: `npm install && cd client && npm install && cd .. && npm run build`
   - Start Command: `npm start`
   - Environment Variables: Add Firebase config
4. Deploy automatically on push to main

### 4. Railway (Full Stack - FREE TIER)
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login and deploy
railway login
railway init
railway up
```

### 5. Vercel (Frontend Only - FREE)
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

### 6. Digital Ocean App Platform
```bash
# Create app spec
cat > app-spec.yaml << EOF
name: gymate
services:
- name: gymate-app
  source_dir: /
  github:
    repo: emmaclaw2026/gymate
    branch: main
  run_command: npm start
  environment_slug: node-js
  instance_count: 1
  instance_size_slug: basic-xs
  envs:
  - key: NODE_ENV
    value: production
EOF

# Deploy
doctl apps create --spec ./app-spec.yaml
```

## Environment Variables Setup

For production deployment, you need to configure these environment variables:

### Firebase Configuration
```bash
FIREBASE_TYPE=service_account
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_PRIVATE_KEY_ID=your-private-key-id
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nYOUR_PRIVATE_KEY\n-----END PRIVATE KEY-----\n"
FIREBASE_CLIENT_EMAIL=your-service-account@gserviceaccount.com
FIREBASE_CLIENT_ID=your-client-id
```

### Node.js Configuration
```bash
NODE_ENV=production
PORT=5000
```

## Docker Deployment

### Local Development
```bash
# Build and run with Docker Compose
docker-compose up --build

# Or build and run separately
docker build -t gymate-app .
docker run -p 5000:5000 gymate-app
```

### Production Deployment
```bash
# Build image
docker build -t gymate-app .

# Tag and push
docker tag gymate-app emmaclaw2026/gymate-app:latest
docker push emmaclaw2026/gymate-app:latest

# Deploy to any cloud that supports Docker
```

## Kubernetes Deployment

For production Kubernetes clusters:

```bash
# Apply deployment
kubectl apply -f k8s-deployment.yaml

# Check deployment status
kubectl get pods -l app=gymate
kubectl get services
```

## CI/CD Pipeline

The `.github/workflows/deploy.yml` file contains a GitHub Actions workflow for automated deployment. To enable it:

1. Set up GitHub Secrets:
   - `DOCKER_HUB_TOKEN`: Your Docker Hub access token
   - `RENDER_SSH_HOST`: Render SSH host (if using Render)
   - `RENDER_SSH_USER`: Render SSH user
   - `RENDER_SSH_KEY`: Render SSH private key

2. Enable GitHub Actions in your repository

## Testing in Production

After deployment, test these features:
- User registration and login
- Google OAuth integration
- Dashboard functionality
- API endpoints

## Monitoring and Maintenance

### Health Checks
- Application health: `GET /health`
- Monitor logs: `heroku logs --tail` (Heroku) or platform-specific logs

### Updates
- Simply push new changes to main branch
- CI/CD will automatically deploy updates

### Scaling
- Heroku: `heroku ps:scale web=2`
- Render: Update instance count in dashboard
- Kubernetes: `kubectl scale deployment gymate-app --replicas=3`

## Troubleshooting

### Common Issues
1. **Firebase Authentication**: Ensure Firebase config is correct
2. **CORS Issues**: Check backend CORS configuration
3. **Build Failures**: Ensure all dependencies are installed
4. **Environment Variables**: Verify all required vars are set

### Debug Commands
```bash
# Check logs
docker logs gymate-app

# Test API endpoint
curl http://localhost:5000/health

# Check environment variables
docker exec gymate-app env
```

Choose your preferred deployment method and follow the instructions above!