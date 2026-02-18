const express = require('express');
const cors = require('cors');
const admin = require('firebase-admin');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Initialize Firebase Admin
const serviceAccount = {
  type: process.env.FIREBASE_TYPE,
  project_id: process.env.FIREBASE_PROJECT_ID,
  private_key_id: process.env.FIREBASE_PRIVATE_KEY_ID,
  private_key: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
  client_email: process.env.FIREBASE_CLIENT_EMAIL,
  client_id: process.env.FIREBASE_CLIENT_ID,
  auth_uri: process.env.FIREBASE_AUTH_URI,
  token_uri: process.env.FIREBASE_TOKEN_URI,
  auth_provider_x509_cert_url: process.env.FIREBASE_AUTH_PROVIDER_CERT_URL,
  client_x509_cert_url: process.env.FIREBASE_CLIENT_CERT_URL
};

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'OK', timestamp: new Date().toISOString() });
});

// API Routes
app.get('/', (req, res) => {
  res.json({ message: 'Gymate API is running!' });
});

// API Routes for workout tracking
app.get('/api/workouts', async (req, res) => {
  try {
    const workoutsRef = db.collection('workouts');
    const snapshot = await workoutsRef.get();
    const workouts = [];
    
    snapshot.forEach(doc => {
      workouts.push({
        id: doc.id,
        ...doc.data()
      });
    });
    
    res.json(workouts);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/workouts', async (req, res) => {
  try {
    const workout = {
      ...req.body,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    };
    
    const docRef = await db.collection('workouts').add(workout);
    res.status(201).json({ id: docRef.id, ...workout });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// API Routes for gym groups
app.get('/api/groups', async (req, res) => {
  try {
    const groupsRef = db.collection('groups');
    const snapshot = await groupsRef.get();
    const groups = [];
    
    snapshot.forEach(doc => {
      groups.push({
        id: doc.id,
        ...doc.data()
      });
    });
    
    res.json(groups);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/groups', async (req, res) => {
  try {
    const group = {
      ...req.body,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    };
    
    const docRef = await db.collection('groups').add(group);
    res.status(201).json({ id: docRef.id, ...group });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// API Routes for events
app.get('/api/events', async (req, res) => {
  try {
    const eventsRef = db.collection('events');
    const snapshot = await eventsRef.get();
    const events = [];
    
    snapshot.forEach(doc => {
      events.push({
        id: doc.id,
        ...doc.data()
      });
    });
    
    res.json(events);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/events', async (req, res) => {
  try {
    const event = {
      ...req.body,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    };
    
    const docRef = await db.collection('events').add(event);
    res.status(201).json({ id: docRef.id, ...event });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Gymate API server is running on port ${PORT}`);
});