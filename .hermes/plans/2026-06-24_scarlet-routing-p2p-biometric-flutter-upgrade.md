# Plan: Routing a incendios, estado de equipo offline P2P, biometría y actualización Flutter

> **Rama:** `feat/fire-routing-team-safety-biometric`
>
> **Meta:** Agregar botón "Ir" en el modal de incendio que calcule ruta offline con grafo vial público y Dijkstra, mostrar el estado de cada miembro del equipo en una incidencia activa mediante red P2P offline con detección de inmovilidad y alertas, auditar la estructura Feature First, actualizar Flutter y agregar login biométrico.
>
> **Restricciones de estilo:** sin comentarios de línea (`//`) ni docstrings (`///`). Todo el código se documenta con nombres y estructura.

---

## Resumen de arquitectura

- **Routing offline:** grafo vial público extraído de OpenStreetMap (Bolivia/región de interés), empaquetado como SQLite en assets y resuelto con Dijkstra en Dart. Se dibuja la ruta sobre `flutter_map` sin depender de internet.
- **P2P / seguridad del equipo:** paquete `nearby_connections` (Android) + `sensors_plus` + `geolocator` para detectar movimiento y transmitir estado entre dispositivos cercanos sin internet.
- **Biometría:** `local_auth` para desbloquear el token ya guardado en `flutter_secure_storage`; no se guarda la contraseña.
- **Estado:** Riverpod `AsyncNotifier`/`Notifier` por feature, GoRouter para navegación, feature-first con capa `domain` faltante en `personnel` y `teams`.

---

## Fase 0 — Preparación y actualización Flutter

### Tarea 0.1: Crear rama

```bash
git checkout -b feat/fire-routing-team-safety-biometric
```

### Tarea 0.2: Actualizar Flutter

```bash
flutter channel stable
flutter upgrade
flutter --version
```

Esperado: Flutter >= 3.42.x (o la última estable disponible), Dart >= 3.12.x.

### Tarea 0.3: Actualizar dependencias y restricciones SDK

**Modificar:** `pubspec.yaml`

- Cambiar `sdk: '>=3.3.0 <4.0.0'` a la versión mínima que imponga el nuevo Flutter.
- Actualizar `flutter_riverpod`, `go_router`, `flutter_map`, `dio`, `geolocator`, `permission_handler`, `flutter_secure_storage`, `flutter_lints` a sus últimas versiones compatibles.
- Agregar:
  - `local_auth: ^2.3.0`
  - `local_auth_android: ^1.0.34`
  - `sensors_plus: ^6.2.0`
  - `nearby_connections: ^3.2.0`
  - `audioplayers: ^6.0.0`
  - `sqflite: ^2.4.0`
  - `path_provider: ^2.1.0`
  - `path: ^1.9.0`

### Tarea 0.4: Resolver análisis y build

```bash
flutter clean
flutter pub get
flutter analyze
```

Corregir cualquier deprecación nueva (por ejemplo `withOpacity` -> `withValues(alpha: ...)`).

### Tarea 0.5: Verificar build mínimo

```bash
flutter build apk --debug
```

Esperado: `app-debug.apk` generado en `build/app/outputs/flutter-apk/`.

---

## Fase 1 — Auditoría Feature First y limpieza estructural

### Tarea 1.1: Agregar capa `domain` faltante en `personnel` y `teams`

**Crear:**
- `lib/features/personnel/domain/personnel_repository.dart`
- `lib/features/personnel/domain/personnel_entity.dart`
- `lib/features/teams/domain/teams_repository.dart`
- `lib/features/teams/domain/team_entity.dart`

**Modificar:**
- `lib/features/personnel/data/personnel_repository.dart` -> implementar la interfaz abstracta.
- `lib/features/teams/data/teams_repository.dart` -> implementar la interfaz abstracta.
- Mover `User` como entidad de `auth` es correcto; `Team` puede tener su propia entidad con `id`, `name`, `isActive`, `memberIds`.

### Tarea 1.2: Estandarizar carpetas de presentación

**Mover:**
- `lib/features/teams/presentation/teams_controller.dart` -> `lib/features/teams/presentation/providers/teams_controller.dart`
- `lib/features/inventory/presentation/controllers/inventory_controller.dart` -> `lib/features/inventory/presentation/providers/inventory_controller.dart`
- `lib/features/auth/presentation/auth_controller.dart` -> `lib/features/auth/presentation/providers/auth_controller.dart`
- Actualizar todos los `import` afectados.

### Tarea 1.3: Extraer widgets compartidos

**Crear:**
- `lib/shared/widgets/loading_overlay.dart`
- `lib/shared/widgets/error_display.dart`

**Modificar:**
- Reemplazar `CircularProgressIndicator` central y los `SnackBar` de error en `map_page.dart`, `teams_page.dart`, `login_page.dart` por los widgets compartidos.

### Tarea 1.4: Commit estructural

```bash
git add .
git commit -m "refactor: align personnel/teams with feature-first architecture"
```

---

## Fase 2 — Configuración nativa para ubicación, P2P y biometría

### Tarea 2.1: Permisos Android

**Modificar:** `android/app/src/main/AndroidManifest.xml`

Agregar dentro de `<manifest>`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
<uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION"/>
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES"/>
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE"/>
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-feature android:name="android.hardware.fingerprint" android:required="false"/>
```

### Tarea 2.2: Cambiar `MainActivity` para `local_auth`

**Modificar:** `android/app/src/main/kotlin/com/example/scarlet_app/MainActivity.kt`

```kotlin
package com.example.scarlet_app

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity()
```

### Tarea 2.3: Ajustar `minSdk`

**Modificar:** `android/app/build.gradle.kts`

```kotlin
defaultConfig {
    minSdk = 23
    targetSdk = flutter.targetSdkVersion
    // ...
}
```

### Tarea 2.4: Permisos iOS

**Modificar:** `ios/Runner/Info.plist`

Agregar:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Scarlet necesita tu ubicación para mostrar incendios cercanos y rutas.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Scarlet necesita ubicación en segundo plano para monitorear la seguridad del equipo durante una incidencia.</string>
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Scarlet usa Bluetooth para conectar dispositivos del equipo sin internet.</string>
<key>NSFaceIDUsageDescription</key>
<string>Scarlet usa Face ID para desbloquear la sesión de forma segura.</string>
```

### Tarea 2.5: Commit configuración nativa

```bash
git add android ios
git commit -m "chore: add permissions for location, p2p and biometric auth"
```

---

## Fase 3 — Routing offline con Dijkstra sobre grafo vial público

La ruta se calcula completamente en el dispositivo usando un grafo vial extraído de OpenStreetMap. No hay fallback de línea recta: si no hay grafo o no existe camino, la app reporta el error al usuario.

### Tarea 3.1: Generador del grafo vial (tooling Python)

**Crear:** `tools/generate_road_graph.py`

Responsabilidades:
1. Descargar el PBF de Bolivia desde Geofabrik (`https://download.geofabrik.de/south-america/bolivia-latest.osm.pbf`).
2. Con `osmnx` cargar el grafo vial:
   ```python
   import osmnx as ox
   G = ox.graph_from_place('Bolivia', network_type='drive', simplify=True, retain_all=False)
   ```
3. Exportar nodos y aristas a SQLite:
   - Tabla `nodes(id INTEGER PRIMARY KEY, lat REAL, lon REAL)`
   - Tabla `edges(u INTEGER, v INTEGER, length REAL, geometry TEXT)`
   - `geometry` como lista de puntos `lat,lon;lat,lon` para reconstruir la polilínea de la ruta.
4. Guardar en `assets/graphs/bolivia_roads.db`.

**Crear:** `tools/requirements.txt`

```text
osmnx>=1.9.0
```

Ejecutar una vez (o cada vez que se quiera actualizar el grafo):

```bash
cd tools
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python generate_road_graph.py
```

Esperado: `assets/graphs/bolivia_roads.db` con nodos/edges indexados.

### Tarea 3.2: Publicar el grafo en assets

**Modificar:** `pubspec.yaml`

```yaml
assets:
  - assets/img/logos/
  - assets/img/icons/
  - assets/graphs/bolivia_roads.db
  - .env
```

### Tarea 3.3: Entidad de ruta

**Crear:** `lib/features/routing/domain/route_entity.dart`

```dart
import 'package:latlong2/latlong.dart';

class Route {
  final List<LatLng> points;
  final double distanceMeters;
  final double durationSeconds;

  const Route({
    required this.points,
    required this.distanceMeters,
    required this.durationSeconds,
  });
}
```

### Tarea 3.4: Cargar el grafo desde assets

**Crear:** `lib/features/routing/data/road_graph_loader.dart`

```dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RoadGraphLoader {
  static const _assetPath = 'assets/graphs/bolivia_roads.db';
  static const _dbName = 'bolivia_roads.db';

  static Future<Database> load() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(documentsDir.path, _dbName);
    final exists = await databaseExists(dbPath);

    if (!exists) {
      final blob = await rootBundle.load(_assetPath);
      final bytes = blob.buffer.asUint8List();
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    return openDatabase(dbPath, readOnly: true);
  }
}
```

### Tarea 3.5: Implementar Dijkstra en Dart

**Crear:** `lib/features/routing/data/dijkstra_router.dart`

```dart
import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:latlong2/latlong.dart';
import '../domain/route_entity.dart';

class Edge {
  final int targetNodeId;
  final double lengthMeters;
  final List<LatLng> geometry;

  const Edge({
    required this.targetNodeId,
    required this.lengthMeters,
    required this.geometry,
  });
}

class DijkstraRouter {
  final Map<int, LatLng> _nodes;
  final Map<int, List<Edge>> _adjacency;

  DijkstraRouter({required Map<int, LatLng> nodes, required Map<int, List<Edge>> adjacency})
      : _nodes = nodes,
        _adjacency = adjacency;

  int nearestNode(LatLng point) {
    var nearestId = -1;
    var bestDistance = double.infinity;
    const distance = Distance();

    for (final entry in _nodes.entries) {
      final d = distance.as(LengthUnit.Meter, point, entry.value);
      if (d < bestDistance) {
        bestDistance = d;
        nearestId = entry.key;
      }
    }

    return nearestId;
  }

  Route route(LatLng from, LatLng to) {
    final startId = nearestNode(from);
    final endId = nearestNode(to);

    if (startId == -1 || endId == -1) {
      throw Exception('No se encontró un nodo cercano en el grafo vial');
    }

    final dist = <int, double>{startId: 0};
    final prev = <int, int>{};
    final prevEdge = <int, Edge>{};
    final visited = <int>{};
    final queue = HeapPriorityQueue<int>((a, b) => dist[a]!.compareTo(dist[b]!));
    queue.add(startId);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == endId) break;
      if (visited.contains(current)) continue;
      visited.add(current);

      for (final edge in _adjacency[current] ?? []) {
        final next = edge.targetNodeId;
        final newDist = dist[current]! + edge.lengthMeters;
        if (newDist < (dist[next] ?? double.infinity)) {
          dist[next] = newDist;
          prev[next] = current;
          prevEdge[next] = edge;
          queue.add(next);
        }
      }
    }

    if (!dist.containsKey(endId)) {
      throw Exception('No existe ruta vial entre los puntos seleccionados');
    }

    final pathPoints = <LatLng>[];
    var current = endId;
    while (current != startId) {
      final edge = prevEdge[current]!;
      pathPoints.insertAll(0, edge.geometry);
      current = prev[current]!;
    }
    pathPoints.insert(0, _nodes[startId]!);

    final durationSeconds = dist[endId]! / 1.2;

    return Route(
      points: pathPoints,
      distanceMeters: dist[endId]!,
      durationSeconds: durationSeconds,
    );
  }
}
```

### Tarea 3.6: Repositorio de routing

**Crear:**
- `lib/features/routing/domain/route_repository.dart`
- `lib/features/routing/data/route_repository_impl.dart`

El repositorio:
1. Carga la base SQLite con `RoadGraphLoader.load()`.
2. Lee todas las aristas y nodos.
3. Construye `DijkstraRouter`.
4. Expone `Future<Route> getRoute(LatLng from, LatLng to)`.

No hay fallback a línea recta. Si `DijkstraRouter.route` lanza, el provider expone el error.

### Tarea 3.7: Provider de ruta

**Crear:** `lib/features/routing/presentation/providers/route_controller.dart`

```dart
final routeControllerProvider = AsyncNotifierProvider.family<RouteController, Route?, LatLng>(
  RouteController.new,
);

class RouteController extends FamilyAsyncNotifier<Route?, LatLng> {
  @override
  Future<Route?> build(LatLng destination) async {
    return null;
  }

  Future<void> calculateRoute(LatLng origin) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(routeRepositoryProvider);
      return await repo.getRoute(origin, arg);
    });
  }
}
```

### Tarea 3.8: Integrar "Ir" en el modal de incendio

**Modificar:** `lib/features/incidents/presentation/map_page.dart`

En `_showFireDetails`, agregar al final del `Column` del modal:

```dart
const SizedBox(height: 16),
SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
    icon: const Icon(Icons.navigation),
    label: const Text('Ir'),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFDF8946),
      foregroundColor: Colors.white,
    ),
    onPressed: () {
      Navigator.pop(context);
      final destination = LatLng(fire.latitude, fire.longitude);
      ref.read(routeControllerProvider(destination).notifier)
          .calculateRoute(_currentLocation);
    },
  ),
),
```

Agregar `PolylineLayer` en el mapa que observe `routeControllerProvider(destination)` y dibuje la ruta calculada.

### Tarea 3.9: Benchmark del grafo

**Crear:** script de prueba temporal `test/routing_benchmark.dart`

- Medir tiempo de carga del grafo.
- Medir tiempo de Dijkstra entre dos puntos aleatorios.
- Medir tamaño del archivo `.db`.

Aceptar si:
- Carga < 3 s en gama media.
- Dijkstra < 500 ms para rutas típicas.
- Archivo < 100 MB.

Si no cumple, reducir el grafo a carreteras principales (`network_type='drive'` ya lo hace; de ser necesario filtrar por `highway` en el generador Python).

### Tarea 3.10: Commit routing

```bash
git add tools assets/graphs lib/features/routing pubspec.yaml
git commit -m "feat: offline dijkstra routing with public OSM road graph"
```

---

## Fase 4 — Estado de equipo offline con P2P

### Tarea 4.1: Modelos de dominio

**Crear:** `lib/features/team_safety/domain/team_member_status.dart`

```dart
import 'package:latlong2/latlong.dart';

enum MemberStatus { active, still, danger, ok }

class TeamMemberStatus {
  final String userId;
  final String fullName;
  final LatLng? location;
  final DateTime lastUpdate;
  final DateTime? lastMovementAt;
  final MemberStatus status;

  const TeamMemberStatus({
    required this.userId,
    required this.fullName,
    this.location,
    required this.lastUpdate,
    this.lastMovementAt,
    required this.status,
  });
}
```

**Crear:** `lib/features/team_safety/domain/team_safety_repository.dart`

```dart
abstract class TeamSafetyRepository {
  Stream<List<TeamMemberStatus>> get teamStatusStream;
  Future<void> advertise(String teamId, String userId);
  Future<void> sendStatus(TeamMemberStatus status);
  Future<void> disconnect();
}
```

### Tarea 4.2: Servicio P2P con `nearby_connections`

**Crear:** `lib/features/team_safety/data/nearby_team_safety_datasource.dart`

Responsabilidades:
- Inicializar `Nearby().startAdvertising` y `startDiscovery` con un `serviceId` único por equipo.
- Enviar mensajes JSON con `sendBytesPayload` a peers descubiertos.
- Exponer un `StreamController<List<TeamMemberStatus>>` con los estados recibidos.

### Tarea 4.3: Repositorio de seguridad del equipo

**Crear:** `lib/features/team_safety/data/team_safety_repository_impl.dart`

Implementar `TeamSafetyRepository` usando el data source.

### Tarea 4.4: Detección de movimiento

**Crear:** `lib/features/team_safety/data/motion_detector.dart`

- Escuchar `Geolocator.getPositionStream` con `distanceFilter: 5`.
- Escuchar `sensors_plus` accelerometerEvents.
- Marcar `lastMovementAt` cuando cambie la ubicación > 5 m o la magnitud del acelerómetro supere umbral.
- Si transcurren 5 minutos sin movimiento, emitir estado `still`.

### Tarea 4.5: Notifier de seguridad del equipo

**Crear:** `lib/features/team_safety/presentation/providers/team_safety_controller.dart`

```dart
final teamSafetyControllerProvider =
    AsyncNotifierProvider<TeamSafetyController, List<TeamMemberStatus>>(
  TeamSafetyController.new,
);

class TeamSafetyController extends AsyncNotifier<List<TeamMemberStatus>> {
  @override
  Future<List<TeamMemberStatus>> build() async {
    return [];
  }

  Future<void> joinIncident(String teamId, String userId) async {
    final repo = ref.read(teamSafetyRepositoryProvider);
    await repo.advertise(teamId, userId);
    final motion = ref.read(motionDetectorProvider);
    motion.start();
    repo.teamStatusStream.listen((statuses) {
      state = AsyncValue.data(statuses);
    });
  }
}
```

### Tarea 4.6: Pantalla de estado del equipo

**Crear:** `lib/features/team_safety/presentation/pages/team_safety_page.dart`

- Lista de miembros con avatar, nombre, última ubicación, estado (verde/amarillo/rojo).
- Botón "Abandonar incidencia" para desconectar P2P.

### Tarea 4.7: Alerta de inmovilidad con auto-respuesta

**Crear:** `lib/features/team_safety/presentation/widgets/danger_self_check_modal.dart`

- Modal no descartable con cuenta regresiva de 30 segundos.
- Botón "Estoy bien" que cambia estado local a `ok` y lo retransmite.
- Si el contador llega a cero, cambiar estado a `danger` y emitir alarma en todos los dispositivos.

**Crear:** `lib/features/team_safety/presentation/widgets/team_alarm.dart`

- Vibración continua con `HapticFeedback.heavyImpact` en bucle.
- Sonido de alarma con `audioplayers` reproduciendo `assets/audio/alarm.mp3`.

### Tarea 4.6: Integrar en navegación, modal de incendio y asignación del backend

**Modificar:** `lib/core/router/app_router.dart`

Agregar ruta `/team-safety` dentro del `ShellRoute`.

**Modificar:** `lib/features/incidents/presentation/map_page.dart`

En el modal de incendio agregar botón secundario "Unirse a incidencia" que:
- Guarde el fuego activo en un provider (`activeFireProvider`).
- Llame a `teamSafetyControllerProvider.notifier.joinIncident(...)`.
- Navegue a `/team-safety`.

**Modificar:** `lib/features/teams/presentation/teams_page.dart`

Al cargar el equipo, consultar el endpoint `GET /api/v1/teams/:teamId/active-incident` (o el que defina el backend). Si devuelve una incidencia activa:
- Mostrar banner destacado "Incidencia activa asignada".
- Ofrecer botón "Ver estado del equipo" que active `teamSafetyController` y navegue a `/team-safety`.

Si no existe el endpoint aún, encapsular la consulta en `TeamsRepository` y dejar el provider listo para cuando el backend lo exponga.

### Tarea 4.7: Commit seguridad del equipo

```bash
git add lib/features/team_safety
git commit -m "feat: offline p2p team safety monitoring with motion alerts"
```

---

## Fase 5 — Login biométrico

### Tarea 5.1: Servicio de biometría

**Crear:** `lib/features/auth/data/biometric_auth_service.dart`

```dart
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> canAuthenticate() async {
    final available = await _localAuth.getAvailableBiometrics();
    return available.isNotEmpty && await _localAuth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await _localAuth.authenticate(
      localizedReason: 'Desbloquea Scarlet',
      authMessages: const [
        AndroidAuthMessages(
          signInTitle: 'Autenticación biométrica',
          cancelButton: 'Cancelar',
        ),
      ],
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}
```

### Tarea 5.2: Persistir preferencia biométrica

**Modificar:** `lib/core/storage/secure_storage.dart`

Agregar:

```dart
static const _biometricEnabledKey = 'biometric_enabled';

Future<bool> isBiometricEnabled() async {
  final raw = await _storage.read(key: _biometricEnabledKey);
  return raw == 'true';
}

Future<void> setBiometricEnabled(bool enabled) async {
  await _storage.write(key: _biometricEnabledKey, value: enabled.toString());
}
```

### Tarea 5.3: Modificar `AuthController`

**Modificar:** `lib/features/auth/presentation/providers/auth_controller.dart`

En `build()`:
- Si existe token y biometría habilitada, intentar autenticación biométrica.
- Si éxito, retornar usuario cacheado (con `userId` y datos básicos).
- Si fallo, retornar `null` y dejar que GoRouter redirija a `/login`.

### Tarea 5.4: Toggle en perfil

**Modificar:** `lib/features/personnel/presentation/profile_page.dart`

Agregar tile "Desbloqueo biométrico" con `Switch` que guarde la preferencia solo si `BiometricAuthService.canAuthenticate()` es true.

### Tarea 5.5: Commit biometría

```bash
git add lib/features/auth lib/core/storage lib/features/personnel
git commit -m "feat: biometric unlock for saved session"
```

---

## Fase 6 — Pruebas, CI y cierre

### Tarea 6.1: Tests unitarios

**Crear:**
- `test/features/routing/data/osrm_route_datasource_test.dart`
- `test/features/team_safety/data/motion_detector_test.dart`
- `test/features/auth/data/biometric_auth_service_test.dart`

### Tarea 6.2: Tests de widgets mínimos

**Crear:**
- `test/features/auth/presentation/login_page_test.dart`
- `test/features/incidents/presentation/map_page_test.dart`

### Tarea 6.3: Análisis y tests locales

```bash
flutter analyze
flutter test
```

Esperado: 0 errores / advertencias relevantes; tests pasan.

### Tarea 6.4: Build release y prueba en dispositivo real

```bash
flutter build apk --release
adb install build/app/outputs/flutter-apk/app-release.apk
```

Verificar:
- Login con biometría.
- Mapa carga incendios.
- Botón "Ir" traza ruta.
- Botón "Unirse a incidencia" abre vista de equipo.
- Dos dispositivos se descubren por P2P y muestran estado.
- Inmovilidad de 5 min dispara modal; sin respuesta suena alarma en el otro.

### Tarea 6.5: GitHub Actions

**Crear:** `.github/workflows/flutter-ci.yml`

```yaml
name: Flutter CI
on:
  push:
    branches: [feat/fire-routing-team-safety-biometric]
  pull_request:
    branches: [main]
jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true
      - run: flutter pub get
      - run: flutter analyze
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true
      - run: flutter pub get
      - run: flutter test
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
          cache: true
      - run: flutter pub get
      - run: flutter build apk --debug
```

### Tarea 6.6: Push y PR

```bash
git push -u origin feat/fire-routing-team-safety-biometric
```

Abrir PR a `main` con descripción de las funcionalidades y screenshots/logs.

---

## Riesgos y preguntas abiertas

1. **P2P:** `nearby_connections` cubre Android. iOS queda explícitamente fuera de este plan para una v2 posterior.
2. **Batería:** ubicación en segundo plano + Bluetooth + Wi-Fi Direct consumen mucho. Considerar reducir frecuencia de actualización cuando el bombero está quieto.
3. **Tamaño del grafo offline:** el grafo vial completo de Bolivia puede pesar decenas de MB. Se debe validar con el benchmark de la Tarea 3.9; si es muy grande, filtrar a carreteras principales en `tools/generate_road_graph.py`.
4. **Rendimiento de Dijkstra:** en gama media, rutas largas podrían superar 500 ms. Si ocurre, evaluar precalcular jerarquías (CH) o usar un motor nativo como GraphHopper/Valhalla embebido.
5. **Asignación a incidencia:** el plan contempla activación manual desde el modal y, en paralelo, lectura de asignaciones desde el backend. Se necesita el endpoint `GET /api/v1/teams/:id/active-incident` (o similar) para activar automáticamente la vista de seguridad.
6. **Persistencia de credenciales:** la biometría solo desbloquea el token existente; no se almacena la contraseña. Confirmar si se desea "autocompletar" usuario/contraseña con biometría (no recomendado).

---

## Resultado esperado

- App en Flutter estable actualizado.
- Estructura 100% Feature First con capas `domain` en todas las features.
- Modal de incendio con botón "Ir" y ruta trazada calculada offline sobre grafo vial público (OpenStreetMap).
- Vista de seguridad del equipo accesible durante una incidencia activa, funcionando offline mediante P2P.
- Alerta de inmovilidad con modal de auto-verificación y alarma en el resto del equipo.
- Login biométrico opcional en perfil.
- CI corriendo `analyze`, `test` y `build apk`.
