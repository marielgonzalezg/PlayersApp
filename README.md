# PlayersApp 🎾

## What the App Does
PlayersApp is an iOS application that displays a list of professional tennis players.  
It shows their **name, country, profile image, and a GIF** that represents each player.  

The app consumes a REST API to fetch the player data and displays it in a clean SwiftUI interface.  

---

## API Endpoint
The app connects to the following deployed API endpoint:

- `GET /players`  
[https://players-api-n6ux.onrender.com/players](https://players-api-n6ux.onrender.com/players)

## How to Run the App
1. Requirements
- Xcode 15.x or later
- iOS target: iOS 17.0+

2. Steps
- Clone the repository:
git clone [https://github.com/marielgonzalezg/PlayersApp.git](https://github.com/marielgonzalezg/PlayersApp.git)
- Open PlayersApp.xcodeproj in Xcode.
- Make sure the API is running at the deployed URL above.
- Select an iOS Simulator (e.g., iPhone 15 Pro).
- Press Run ▶ in Xcode.

The endpoint returns a JSON array of player objects, each with the following fields:  

```json
{
  "name": "Roger Federer",
  "country": "Switzerland",
  "imageName": "federer.png",
  "gifUrl": "https://media.giphy.com/media/federer.gif"
}
