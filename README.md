# Scarlet App (Mobile)

Tactical mobile application for field personnel (firefighters, brigade members, commanders). Provides geolocated incident visualization, duty status updates, mission dispatch notifications (Push/NATS), and real-time telemetry.

## Tech

- **Framework**: Flutter
- **State Management**: Riverpod
- **Models**: Freezed (immutable data classes)
- **Routing**: GoRouter
- **Architecture**: Feature-First Clean Architecture
- **Backend**: gRPC via Envoy Gateway

## Structure

```
lib/
├── core/          # Shared infrastructure (routing, network, theme)
└── features/      # Feature modules (inventory, personnel, etc.)
```

## Commands

```bash
# Code generation (Freezed/Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Run
flutter run
```
