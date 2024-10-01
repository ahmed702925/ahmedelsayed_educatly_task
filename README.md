# ahmedelsayed_educatly_task
 ahmedelsayed_educatly_task
 # Real-Time Chat Application with Firebase and Flutter

This project implements a real-time chat application using **Flutter**, **Firebase Authentication**, and **Firestore**. The app enables users to sign up, log in, and exchange messages in real time. It uses the **BLoC (Business Logic Component)** pattern for state management, ensuring clean and maintainable code.

## Table of Contents
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Firebase Setup](#firebase-setup)
- [BLoC Architecture](#bloc-architecture)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

---

## Features
- **Firebase Authentication**: Users can sign up, log in, and log out using Firebase Authentication.
- **Real-Time Chat**: Messages are sent and received in real-time using Firestore.
- **State Management**: Uses the BLoC pattern to manage application state.
- **Clean Architecture**: Follows best practices to separate UI, business logic, and data layers.

---

## Project Structure

```plaintext
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
│           └── firebase_chat_repository.dart  # Firebase repository for Firestore operations
│
└── common/
    └── widgets/
        └── loading_indicator.dart    # Loading indicator for async operations
Getting Started
Prerequisites
Flutter SDK: Install Flutter
Firebase CLI: Install Firebase CLI
A Firebase project with Firestore and Authentication enabled
Setup Instructions
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
Install Flutter dependencies:

bash
Copy code
flutter pub get
Firebase Setup:

Create a Firebase project in the Firebase Console.
Enable Firestore and Firebase Authentication (Email/Password sign-in).
Download the google-services.json file and place it in the android/app/ directory.
Update android/build.gradle: Add the following line to the android/build.gradle file:

gradle
Copy code
classpath 'com.google.gms:google-services:4.3.10'
Update android/app/build.gradle: Add the following lines to the android/app/build.gradle file:

gradle
Copy code
apply plugin: 'com.google.gms.google-services'

dependencies {
    implementation 'com.google.firebase:firebase-auth-ktx'
    implementation 'com.google.firebase:firebase-firestore-ktx'
}
Usage
Running the App
Run the app on your Android or iOS device:

bash
Copy code
flutter run
Sign up with an email and password, and you will be directed to the chat screen.

Send and receive messages in real time with other authenticated users.

Firebase Setup
Enable Firebase Authentication:

Go to the Firebase Console > Authentication > Sign-in method.
Enable Email/Password authentication.
Enable Firestore:

Go to the Firebase Console > Firestore Database.
Set Firestore to Test Mode during development.
Add google-services.json:

Download the google-services.json file from Firebase and place it under android/app/.
BLoC Architecture
The app uses the BLoC (Business Logic Component) pattern to separate the presentation layer from the business logic.
Events: Events like SendMessageEvent are dispatched when a user sends a message.
States: States like ChatLoaded contain the list of messages retrieved from Firestore.
Example BLoC Code:
dart
Copy code
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  ChatBloc(this.sendMessageUseCase) : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      await sendMessageUseCase.sendMessage(event.message.content);
      emit(ChatLoaded(messages: []));  // Add real message fetching logic
    });
  }
}
Testing
Test the app on an emulator or physical device with internet access.
Use Firebase Authentication to sign up/log in and test the chat functionality.
Ensure real-time updates for chat messages by testing with multiple devices.

