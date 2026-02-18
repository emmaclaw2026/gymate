import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useAuth } from './contexts/AuthContext';
import Layout from './components/Layout';
import Login from './components/Login';
import Signup from './components/Signup';
import Dashboard from './components/Dashboard';
import Profile from './components/Profile';
import GymFeed from './components/GymFeed';
import GymGroups from './components/GymGroups';
import GymEvents from './components/GymEvents';

function App() {
  const { currentUser, loading } = useAuth();

  if (loading) {
    return (
      <div className="loading">
        <div className="spinner"></div>
      </div>
    );
  }

  return (
    <Layout>
      <Routes>
        <Route path="/" element={
          currentUser ? <Navigate to="/dashboard" /> : <Login />
        } />
        <Route path="/signup" element={
          currentUser ? <Navigate to="/dashboard" /> : <Signup />
        } />
        <Route path="/dashboard" element={
          currentUser ? <Dashboard /> : <Navigate to="/" />
        } />
        <Route path="/profile" element={
          currentUser ? <Profile /> : <Navigate to="/" />
        } />
        <Route path="/feed" element={
          currentUser ? <GymFeed /> : <Navigate to="/" />
        } />
        <Route path="/groups" element={
          currentUser ? <GymGroups /> : <Navigate to="/" />
        } />
        <Route path="/events" element={
          currentUser ? <GymEvents /> : <Navigate to="/" />
        } />
      </Routes>
    </Layout>
  );
}

export default App;