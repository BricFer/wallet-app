# 💸 Money Tracker — Personal Finance Manager

A full-stack personal finance application built with **Flutter** and **Java Spring Boot**, developed as the final project for the *Desenvolupament d'aplicacions mòbils per a iOS i Android amb Flutter* course at CIFO L'Hospitalet de Llobregat.

---

## Features

- 📊 Income and expense tracking with custom categories
- 💼 Group management for shared finances
- 📅 Recurring expense configuration
- 💳 Payment method management
- 🔐 Secure authentication via Firebase Auth (JWT tokens)
- 🌐 Cross-platform support: Android, iOS, and Web

---

## Tech Stack

### Frontend
| Technology | Purpose |
|---|---|
| Flutter (Dart) | Cross-platform UI framework |
| Provider | State management (AuthProvider, UserProvider, feature providers) |
| GoRouter | Navigation and auth-based route protection |
| Firebase Auth | Authentication token handling |

### Backend
| Technology | Purpose |
|---|---|
| Java Spring Boot | REST API |
| PostgreSQL | Relational database |
| Railway | Cloud deployment |
| Firebase Admin SDK | JWT token verification |

---

## Architecture

The backend follows a **layered architecture** (Controller → Service → Repository), with Spring Security handling token validation on each request. Firebase Auth is used exclusively for authentication — all application data is persisted in PostgreSQL.

The Flutter frontend uses **Provider** for state management, with a clean separation between:
- `AuthProvider` — session state and Firebase token lifecycle
- `UserProvider` — authenticated user profile data
- Feature-level providers — scoped to each functional module

---

## Key Technical Challenges

- **CORS configuration** between Flutter Web and the Spring Boot API
- **GoRouter redirect logic** for auth-protected routes with async state
- **Firebase token handling** on Flutter Web (different from mobile flows)
- **Provider architecture** design to avoid unnecessary rebuilds and maintain clean separation of concerns

---

## Project Structure

```
wallet-app/
├── lib/
│   ├── core/
│   │   ├── constants/      # App-wide constants
│   │   ├── providers/      # Global providers (AuthProvider, UserProvider)
│   │   ├── routes/         # GoRouter configuration and auth redirect logic
│   │   └── themes/         # Design system (colours, typography, decorations)
│   ├── models/             # Data models, organised by domain entity
│   │   ├── category/
│   │   ├── expense/
│   │   ├── group/
│   │   ├── income/
│   │   ├── payment_method/
│   │   └── user/
│   ├── screens/            # Feature screens
│   ├── service/            # API client layer (HTTP calls to the backend)
│   └── widgets/            # Reusable UI components
│       ├── forms/
│       ├── layout/
│       ├── navigation/
│       ├── profile/
│       ├── theme/
│       └── transactions/
├── backend/
│   └── src/main/java/com/walletapp/demo/
│       ├── config/         # Spring Security, CORS, Firebase Admin SDK setup
│       ├── constants/      # Shared constants
│       ├── controller/     # REST controllers
│       ├── dtos/
│       │   ├── request/    # Incoming request DTOs
│       │   └── response/   # Outgoing response DTOs
│       ├── entity/         # JPA entities
│       ├── enums/          # Shared enumerations (stored as strings in DB)
│       ├── filter/         # Firebase JWT authentication filter
│       ├── repository/     # Spring Data JPA repositories
│       └── service/        # Business logic layer
└── assets/
    └── images/
```

---

## Getting Started

### Prerequisites
- Flutter SDK >= 3.0
- Java 17+
- PostgreSQL
- Firebase project with Authentication enabled

### Backend setup
```bash
cd backend
# Configure your environment variables
cp src/main/resources/application.properties.example src/main/resources/application.properties
# Run the API
./mvnw spring-boot:run
```

### Flutter setup
```bash
flutter pub get
flutter run
```

> ⚠️ You will need to provide your own `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) from your Firebase project.

---

## Author

**Briceida Fernandez**
[LinkedIn](https://www.linkedin.com/in/briceidafernandez) · [GitHub](https://github.com/BricFer)
