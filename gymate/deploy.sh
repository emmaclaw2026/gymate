#!/bin/bash

# Gymate Deployment Script

echo "🚀 Deploying Gymate to Cloud..."

# Check if we're in the correct directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Please run this script from the project root."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install
cd client && npm install && cd ..

# Build the React app
echo "🔨 Building React app..."
cd client && npm run build && cd ..

# Create .env file for production if it doesn't exist
if [ ! -f ".env.production" ]; then
    echo "⚙️ Creating production environment file..."
    cp .env.example .env.production
    echo "⚠️  Please update .env.production with your Firebase configuration"
fi

echo "✅ Deployment preparation complete!"
echo ""
echo "📖 Deployment Options:"
echo ""
echo "1. Heroku (Free Tier):"
echo "   heroku create gymate-app-prod"
echo "   heroku config:set NODE_ENV=production"
echo "   git push heroku main"
echo ""
echo "2. Render (Free Tier):"
echo "   - Connect GitHub repo to Render"
echo "   - Set up Web Service"
echo "   - Configure environment variables"
echo ""
echo "3. Railway (Free Tier):"
echo "   railway login"
echo "   railway init"
echo "   railway up"
echo ""
echo "4. Vercel (Frontend only):"
echo "   vercel --prod"
echo ""
echo "5. Digital Ocean App Platform:"
echo "   doctl apps create --spec ./app-spec.yaml"
echo ""
echo "Choose your preferred deployment method and follow the instructions above!"