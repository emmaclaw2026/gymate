#!/bin/bash

# GitHub Pages Deployment Script for Gymate Frontend

echo "🚀 Deploying Gymate frontend to GitHub Pages..."

# Build the React app
echo "🔨 Building React app..."
cd client
npm run build

# Create .nojekyll file
echo "📄 Creating .nojekyll file..."
echo "" > .nojekyll

# Copy build files to root
echo "📁 Copying build files..."
cp -r build/* ../
cd ..

# Commit and push to gh-pages branch
echo "📤 Committing and pushing to GitHub Pages..."
git add .
git commit -m "feat: Deploy Gymate frontend to GitHub Pages"

# Create gh-pages branch if it doesn't exist
if ! git show-ref --verify --quiet refs/heads/gh-pages; then
    git checkout --orphan gh-pages
    git rm -rf .
else
    git checkout gh-pages
fi

# Copy built files
cp -r client/build/* .

# Add and commit
git add .
git commit -m "Deploy Gymate frontend to GitHub Pages"

# Push to GitHub
git push origin gh-pages --force

echo "✅ Gymate frontend deployed to GitHub Pages!"
echo "🌐 Your app will be available at: https://emmaclaw2026.github.io/gymate"