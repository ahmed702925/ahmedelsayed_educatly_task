# ahmedelsayed_educatly_task
 ahmedelsayed_educatly_task
 # Real-Time Chat Application with Firebase and Flutter

This project implements a real-time chat application using **Flutter**, **Firebase Authentication**, and **Firestore**. The app enables users to sign up, log in, and exchange messages in real time. It uses the **BLoC (Business Logic Component)** pattern for state management, ensuring clean and maintainable code.

## Table of Contents
- [Features](#features)
- [Project Structure](#project-structure)
- [Setup](#setup)
- [Usage](#usage)
- [BLoC Architecture](#bloc-architecture)

---

## Features
- **Firebase Authentication**: Users can sign up, log in, and log out using Firebase Authentication.
- **Real-Time Chat**: Messages are sent and received in real-time using Firestore.
- **State Management**: Uses the BLoC pattern to manage application state.
- **Clean Architecture**: Follows best practices to separate UI, business logic, and data layers.

---

## Project Structure
The project follow the below example clean structure:

lib/
│
├── main.dart                          # Application entry point
│
├── features/
│   └── chat/
│       ├── presentation/              # Presentation layer (UI)
│       │   ├── chat_screen.dart       # Chat screen widget
│       │   ├── message_input_field.dart  # Message input widget
│       │   └── chat_list.dart         # Widget to display messages
│       │
│       ├── bloc/                      # State management using BLoC
│       │   ├── chat_bloc.dart
│       │   ├── chat_event.dart
│       │   └── chat_state.dart
│       │
│       ├── domain/                    # Business logic and models
│       │   ├── message.dart           # Message entity/model
│       │   └── usecases/
│       │       └── send_message_usecase.dart  # Use case for sending messages
│       │
│       └── data/
│           └── firebase_chat_repository.dart  # Firebase repository for Firestore    

## Setup

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```
## Usage

1. **Run the app**:
    ```bash
    flutter run
    ```

2. **Sign up** with email/password and start sending messages in real-time.

## BLoC Architecture

- Events like `SendMessageEvent` are dispatched when a user sends a message.
- States like `ChatLoaded` handle the list of messages.