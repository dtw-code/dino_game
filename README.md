# Dino Game 🦖

A fun and interactive dinosaur running game built with **Flutter**. This project is a cross-platform implementation of the classic Chrome Dino Game, playable on mobile, web, desktop, and more!

## 📋 Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Project Structure](#project-structure)
- [Features](#features)
- [Platforms](#platforms)
- [How to Play](#how-to-play)

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart** - Comes with Flutter
- **Git** - For cloning the repository

### Installation & Setup

Follow these steps to get the project running on your machine:

#### 1. Clone the Repository

```bash
git clone https://github.com/dtw-code/dino_game.git
cd dino_game
```

#### 2. Install Dependencies

Run the following command to fetch and install all required Flutter packages:

```bash
flutter pub get
```

#### 3. Run the Application

**For Mobile (Android/iOS):**
```bash
flutter run
```

**For Web:**
```bash
flutter run -d chrome
# or
flutter run -d firefox
```

**For Desktop (Linux/macOS/Windows):**
```bash
flutter run -d linux
flutter run -d macos
flutter run -d windows
```

## 📁 Project Structure

The project is organized as follows:

```
dino_game/
├── lib/
│   ├── dino.dart                 # Manages the dino sprite and animations
│   ├── dino_game.dart            # Core game logic and game engine
│   ├── game_overlay.dart         # UI overlay for game start/stop controls
│   ├── ground.dart               # Ground mechanics and scrolling
│   ├── obstacle.dart             # Obstacle generation and collision detection
│   ├── score_text.dart           # Score display and tracking
│   └── main.dart                 # App entry point
│
├── assets/
│   ├── images/                   # Game sprites and graphics
│   │   ├── dino/                 # Dinosaur sprite images
│   │   ├── obstacles/            # Obstacle images
│   │   └── ground/               # Ground textures
│   └── fonts/                    # Custom fonts (if any)
│
├── android/                      # Android-specific configuration
├── ios/                          # iOS-specific configuration
├── web/                          # Web-specific configuration
├── linux/                        # Linux-specific configuration
├── macos/                        # macOS-specific configuration
├── windows/                      # Windows-specific configuration
│
├── pubspec.yaml                  # Project dependencies and metadata
├── pubspec.lock                  # Locked dependency versions
├── analysis_options.yaml         # Dart analysis configuration
├── .gitignore                    # Git ignore rules
└── README.md                     # This file

```

### 📄 Key Files Description

| File | Description |
|------|-------------|
| **dino.dart** | Handles the dinosaur sprite, animations, and movement mechanics |
| **dino_game.dart** | Contains the core game loop, game state management, and overall game logic |
| **game_overlay.dart** | Provides fancy UI components for start/stop operations and game menus |
| **ground.dart** | Manages ground scrolling, collision detection, and ground-related mechanics |
| **obstacle.dart** | Handles obstacle creation, spawning, and collision detection with the dino |
| **score_text.dart** | Displays and tracks the player's current score |
| **assets/images/** | Stores all the image assets used in the game (sprites, backgrounds, obstacles) |

## ✨ Features

- 🎮 **Smooth Gameplay** - Responsive controls and smooth animations
- 🏃 **Progressive Difficulty** - Game speed increases as your score increases
- 📱 **Cross-Platform** - Play on mobile, web, and desktop
- 🎨 **Retro Graphics** - Classic dino game aesthetics
- 📊 **Score Tracking** - Keep track of your high scores
- ⌨️ **Simple Controls** - Tap/Click to jump, collect points by avoiding obstacles

## 🖥️ Platforms

This game can be compiled and run on multiple platforms:

- **Mobile**: Android & iOS
- **Web**: Chrome, Firefox, Safari, Edge
- **Desktop**: Windows, macOS, Linux

## 🎮 How to Play

1. **Start the Game** - Tap/Click the start button
2. **Jump** - Tap/Click or press Space to make the dinosaur jump
3. **Avoid Obstacles** - Don't hit the oncoming obstacles
4. **Score Points** - Each obstacle you successfully avoid increases your score
5. **Game Over** - If you collide with an obstacle, the game ends
6. **Retry** - Tap/Click the restart button to play again

## 📦 Dependencies

All dependencies are managed through `pubspec.yaml`. Run `flutter pub get` to install them.

## 🤝 Contributing

Feel free to fork this project and submit pull requests with improvements!

## 📄 License

This project is open source and available under the MIT License.

---

**Enjoy the game! 🦖🎮**