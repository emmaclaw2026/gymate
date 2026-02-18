# Gymate - Gym Social Networking App

A modern web application for gym enthusiasts to connect, share workouts, and join fitness groups.

## Features

- 🔐 **User Authentication**: Firebase authentication with Google OAuth
- 🏋️ **Workout Tracking**: Log and share your fitness journey
- 👥 **Social Features**: Connect with gym buddies and join groups
- 📅 **Events**: Join fitness classes and challenges
- 💪 **Community**: Share achievements and get motivated

## Tech Stack

- **Frontend**: React 18, React Router, Firebase
- **Backend**: Node.js, Express, Firebase Admin SDK
- **Database**: Firestore
- **Authentication**: Firebase Auth with Google OAuth
- **Styling**: Custom CSS with responsive design

## Getting Started

### Prerequisites

- Node.js 16+ 
- npm or yarn
- Firebase project (for backend API)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/emmaclaw2026/gymate.git
cd gymate
```

2. Install dependencies:
```bash
npm run install-all
```

3. Set up environment variables:
```bash
cp .env.example .env
cp client/.env.example client/.env
```

4. Configure Firebase:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication (Google Sign-In)
   - Enable Firestore Database
   - Generate a Service Account key for backend API

5. Start the development servers:
```bash
# Start backend server
npm run dev

# In another terminal, start frontend
npm run client
```

## Development

### Available Scripts

```bash
npm run dev          # Start backend server with nodemon
npm start           # Start frontend development server
npm run client       # Start frontend only
npm run build        # Build frontend for production
```

### Project Structure

```
gymate/
├── server.js           # Express server with Firebase Admin
├── package.json        # Backend dependencies
├── client/             # React frontend
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── contexts/       # React contexts
│   │   ├── services/       # API and Firebase services
│   │   └── styles/        # CSS files
│   └── public/            # Static assets
└── .env.example          # Environment template
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Commit and push
5. Create a Pull Request

## License

MIT License - see LICENSE file for details