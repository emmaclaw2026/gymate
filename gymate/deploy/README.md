# Gymate - Gym Social Networking App

🏋️ **Gymate** is a modern web application for gym enthusiasts to connect, share workouts, and join fitness groups.

## 🚀 Live Deployment

The Gymate project is ready for deployment! Here are the available options:

### Quick Deploy Options

1. **GitHub Pages (Frontend Showcase)**
   ```bash
   ./deploy-gh-pages.sh
   ```
   🌐 **URL**: https://emmaclaw2026.github.io/gymate

2. **Heroku (Full Stack)**
   ```bash
   heroku create gymate-app-prod
   heroku config:set NODE_ENV=production
   git push heroku main
   ```

3. **Render (Free Tier)**
   - Connect GitHub repo to Render
   - Set up Web Service with Node.js
   - Auto-deploy on push to main

4. **Railway (Free Tier)**
   ```bash
   railway login
   railway init
   railway up
   ```

## ✅ Features Completed

- 🔐 **User Authentication**: Firebase auth with Google OAuth
- 🏗️ **Project Structure**: React + Express + Firebase
- 📱 **Responsive Design**: Mobile-friendly interface
- 🎨 **Modern UI**: Clean, intuitive design
- 🔧 **Development Tools**: Hot reload, linting, testing
- 📦 **Deployment Ready**: Multiple deployment options
- 📚 **Documentation**: Comprehensive guides and README

## 🛠️ Tech Stack

- **Frontend**: React 18, React Router, Firebase
- **Backend**: Node.js, Express, Firebase Admin SDK
- **Database**: Firestore
- **Authentication**: Firebase Auth with Google OAuth
- **Styling**: Custom CSS with responsive design
- **Deployment**: Docker, GitHub Actions, multiple cloud platforms

## 📋 Next Steps

1. **Set up Firebase Project**
   - Create Firebase project at https://console.firebase.google.com
   - Enable Google OAuth authentication
   - Create Service Account for backend access

2. **Configure Environment Variables**
   - Copy `.env.example` to `.env.production`
   - Add your Firebase configuration

3. **Deploy to Cloud**
   - Choose your preferred deployment platform
   - Follow the deployment guide in `DEPLOYMENT.md`

4. **Test and Monitor**
   - Test user registration and login
   - Monitor application health
   - Set up logging and analytics

## 🎯 Getting Started

### Local Development
```bash
# Clone the repository
git clone https://github.com/emmaclaw2026/gymate.git
cd gymate

# Install dependencies
npm run install-all

# Start development servers
npm run dev          # Backend
npm run client       # Frontend
```

### Deployment
```bash
# Quick deployment script
./deploy.sh

# GitHub Pages deployment
./deploy-gh-pages.sh
```

## 📁 Project Structure

```
gymate/
├── server.js           # Express server with Firebase Admin
├── client/              # React frontend
│   ├── src/
│   │   ├── components/  # React components
│   │   ├── contexts/   # React contexts
│   │   ├── services/    # API and Firebase services
│   │   └── styles/      # CSS files
│   └── public/          # Static assets
├── deploy/              # Static deployment files
├── DEPLOYMENT.md        # Comprehensive deployment guide
└── README.md            # Project documentation
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Commit and push
5. Create a Pull Request

## 📄 License

MIT License - see LICENSE file for details

---

**Built with ❤️ by Emma Claw**

🌟 **Star this repository** if you find it useful!