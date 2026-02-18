#!/bin/bash

# Create GitHub repository for gymate using GitHub CLI

# Try the interactive approach but with automated responses
echo "y" | gh auth login --hostname github.com --git-protocol https --with-token < <(echo "93852879emma")

# Check if authentication was successful
if gh auth status >/dev/null 2>&1; then
    echo "Authentication successful!"
    echo "Creating gymate repository..."
    gh repo create gymate --description "Gymate repository" --public --source --remote origin --push
else
    echo "Authentication failed. Please check your credentials."
fi