# Tet_persist

![Tet_persist Banner](https://github.com/Tetlys/TetPersist/blob/main/GIT/Assets/banner.png)

## Introduction

**Tet_persist** is an Arma 3 PBO mission module coded in SQF. It allows administrators to dynamically save objects placed by Zeus and persist changes between game sessions. This system is designed to ensure that important in-game assets, player progress, and mission-critical elements remain intact across server restarts or mission replays.

[![Discord](https://img.shields.io/badge/Discord-Join%20Us-blue?style=for-the-badge&logo=discord)](https://discord.gg/4DdMKvJjMa) [![Roadmap](https://img.shields.io/badge/Roadmap-Visit%20Wiki-blue?style=for-the-badge)](https://github.com/Tetlys/TetPersist/wiki/Roadmap)


## Features 🌟

- **Dynamic Object Persistence**: Save and reload vehicles, objects, and players across sessions.
- **Vehicle Persistence**: Saves vehicle position, inventory, and damage states.
- **Player Persistence**: Tracks player locations, inventories, equipment, and medical states.
- **Object Persistence**: Saves mission-critical objects such as turrets, ammo boxes, and other placed items, including cargo loaded into vehicles or placed on the ground.

## How It Works 📚

This module tracks and saves the positions, inventories, and states of various game elements at the beginning and end of gameplay, ensuring they persist when a session ends and are reloaded when it resumes without ever effecting server or player performance.

## Usage 🚀

1. Install the PBO module in your mission.
2. Configure Zeus to dynamically place objects and vehicles.
3. Enjoy seamless session-to-session persistence.

## Requirements ⚠️

- Arma 3
- Basic knowledge of Zeus mission creation

## Installation 🛠️

1. Copy the `TET PERSIST` folder into your mission folder.
2. Copy or combine the Description.ext & Init.sqf from BASE into your mission folder.
3. Follow the included instructions to set up the saving functionality.
