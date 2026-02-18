import React from 'react';
import { useAuth } from '../contexts/AuthContext';
import './Dashboard.css';

function Dashboard() {
  const { currentUser } = useAuth();

  return (
    <div className="dashboard">
      <div className="container">
        <div className="dashboard-header">
          <h1>Welcome back, {currentUser?.displayName || currentUser?.email}!</h1>
          <p>Your fitness journey starts here</p>
        </div>
        
        <div className="dashboard-grid">
          <div className="dashboard-card">
            <h3>Activity Feed</h3>
            <p>See what's happening in your gym community</p>
            <button className="btn btn-primary">View Feed</button>
          </div>
          
          <div className="dashboard-card">
            <h3>Your Groups</h3>
            <p>Connect with like-minded fitness enthusiasts</p>
            <button className="btn btn-primary">My Groups</button>
          </div>
          
          <div className="dashboard-card">
            <h3>Upcoming Events</h3>
            <p>Join fitness classes and challenges</p>
            <button className="btn btn-primary">View Events</button>
          </div>
          
          <div className="dashboard-card">
            <h3>Profile</h3>
            <p>Update your fitness goals and achievements</p>
            <button className="btn btn-primary">Edit Profile</button>
          </div>
        </div>
        
        <div className="quick-stats">
          <h3>Quick Stats</h3>
          <div className="stats-grid">
            <div className="stat-item">
              <span className="stat-number">0</span>
              <span className="stat-label">Workouts</span>
            </div>
            <div className="stat-item">
              <span className="stat-number">0</span>
              <span className="stat-label">Groups</span>
            </div>
            <div className="stat-item">
              <span className="stat-number">0</span>
              <span className="stat-label">Friends</span>
            </div>
            <div className="stat-item">
              <span className="stat-number">0</span>
              <span className="stat-label">Events</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;