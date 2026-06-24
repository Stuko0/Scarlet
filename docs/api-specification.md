# Scarlet App — Documento de Integración Backend-Frontend

## 1. Arquitectura general

- **Base URL:** `https://api.stuko.dev`
- **Autenticación:** JWT Bearer token en header `Authorization: Bearer <token>`
- **Formato:** JSON, snake_case en request/response
- **Frontend:** Flutter 3.44.3, Riverpod, GoRouter, flutter_map, sqflite

---

## 2. Endpoints Existentes (consumidos por la app)

### 2.1 Auth

#### POST /api/v1/auth/login

**Request:**
```json
{
  "email": "string",
  "password": "string"
}
```

**Response 200:**
```json
{
  "token": "string (JWT)",
  "user_id": 123,
  "full_name": "Juan Pérez",
  "email": "juan@example.com",
  "phone": "+591...",
  "blood_type": "O+",
  "role": "COMMANDER",
  "years_experience": 5,
  "is_active": true,
  "duty_status": "off-duty",
  "institution_id": 1,
  "team_id": 5
}
```

**Nota:** El `User.fromJson` acepta tanto snake_case como camelCase (`userId` / `user_id`). Se prefiere snake_case.

---

### 2.2 Teams

#### GET /api/v1/teams/:teamId

**Response 200:**
```json
{
  "id": 5,
  "name": "Brigada Cobija",
  "is_active": true
}
```

**Nota:** El frontend también espera `teamName` como alias de `name`, pero tras la refactorización (Fase 1) se normalizó a `name` mediante la entidad `Team`.

---

#### GET /api/v1/teams/:teamId/users

**Response 200:**
```json
{
  "users": [
    {
      "id": 123,
      "full_name": "Juan Pérez",
      "email": "juan@example.com",
      "phone": "+591...",
      "blood_type": "O+",
      "role": "COMMANDER",
      "years_experience": 5,
      "is_active": true,
      "duty_status": "on-duty",
      "institution_id": 1,
      "team_id": 5
    }
  ]
}
```

**Campos usados por el frontend (TeamsPage):**
- `id` — identificador único
- `full_name` — nombre completo (primera letra para avatar)
- `role` — COMMANDER, SUPERADMIN, INSTITUTION_ADMIN, MEMBER, CIVILIAN
- `duty_status` — "on-duty" / "off-duty"
- `blood_type` — tipo de sangre (ej. "O+")
- `years_experience` — años de experiencia
- `phone` — teléfono de contacto

---

### 2.3 Personnel

#### PATCH /api/v1/users/:userId/status

Actualiza el estado operativo del usuario.

**Request:**
```json
{
  "duty_status": "on-duty"
}
```

Valores aceptados en frontend: `"on-duty"`, `"off-duty"`.

---

#### POST /api/v1/personnel/location

Reporta la ubicación GPS del usuario (para tracking en segundo plano).

**Request:**
```json
{
  "user_id": 123,
  "latitude": -17.413977,
  "longitude": -66.165321,
  "timestamp_ms": 1718200000000
}
```

**Uso actual:** no implementado en la interfaz. Expuesto por `PersonnelRepository.reportLocation()`. Podría usarse en conjunto con el P2P team safety para respaldo en servidor.

---

### 2.4 Incidents / Wildfire

#### GET /api/wildfire/v1/active

**Response 200:**
```json
{
  "fires": [
    {
      "event_id": "VIIRS_20260624_001",
      "latitude": -17.413,
      "longitude": -66.165,
      "confidence": "h",
      "temperature": 340.5,
      "humidity": 25.0,
      "wind": 12.3,
      "frp": 45.2,
      "brightness": 320.1,
      "scan": 1.2,
      "track": 0.8,
      "satellite": "NOAA-20",
      "acq_date": "2026-06-24",
      "acq_time": "1430",
      "daynight": "D"
    }
  ]
}
```

**Alternativa aceptada:** array directo de incendios sin wrapper `{ "fires": [...] }`.

**Confianza (confidence):** `"h"` = alta (100%), `"n"` = nominal (60%), `"l"` = baja (30%). También acepta valor numérico 0-100.

---

### 2.5 Inventory / Assets

#### GET /api/v1/inventory/assets

**Response 200:**
```json
{
  "assets": [
    {
      "id": 10,
      "institution_id": 1,
      "callsign": "UNIDAD-01",
      "category": "Camión cisterna",
      "status": "READY",
      "water_capacity_liters": 5000,
      "fuel_level_percent": 85,
      "last_known_lat": -17.4,
      "last_known_lng": -66.1
    }
  ]
}
```

**Estados usados por frontend:** `READY`, `IN_SERVICE`, `MAINTENANCE` (también acepta equivalentes en español: `DISPONIBLE`, `DESPLEGADO`, `MANTENIMIENTO`).

---

#### PATCH /api/v1/inventory/assets/:id/status

**Request:**
```json
{
  "status": "IN_SERVICE"
}
```

**Response 200:** el asset actualizado (misma estructura que en GET).

---

## 3. Endpoints NUEVOS requeridos por las features implementadas

### 3.1 Tiles de routing (Fase 3)

Los tiles son archivos SQLite pre-generados con el script `tools/generate_road_graph.py`. Cada tile cubre 0.5° x 0.5° con buffer de 0.1°.

#### GET /api/v1/routing/tiles/:tileKey

**Parámetros de ruta:**
- `tileKey` — formato `s{lat}_w{lon}.db`, ej: `s17.5_w66.0.db`

**Response 200:** archivo binario SQLite (Content-Type: `application/octet-stream`)

**Tablas en cada tile:**
```sql
-- Nodos viales (coordenadas)
CREATE TABLE nodes (
  id INTEGER PRIMARY KEY,   -- OSM node ID original
  lat REAL,                 -- latitud en grados
  lon REAL                  -- longitud en grados
);

-- Aristas viales (segmentos de calle)
CREATE TABLE edges (
  u INTEGER,                -- node ID origen
  v INTEGER,                -- node ID destino
  length REAL,              -- longitud en metros
  geometry TEXT             -- polilínea: "lat,lon;lat,lon;..."
);

CREATE INDEX idx_edges_u ON edges(u);
CREATE INDEX idx_edges_v ON edges(v);
```

**Acciones requeridas:**
1. Crear directorio en el backend para almacenar los `.db` tiles
2. Servirlos estáticamente o con un handler Go/PocketBase en `/api/v1/routing/tiles/`
3. Ejecutar `tools/generate_road_graph.py` para generar los tiles
4. Subir los tiles generados al backend

---

### 3.2 Incidencia activa del equipo (Fase 4 — Team Safety)

La vista de seguridad del equipo necesita saber si el equipo tiene una incidencia asignada.

#### GET /api/v1/teams/:teamId/active-incident

**Response 200 (con incidencia activa):**
```json
{
  "active": true,
  "incident_id": "VIIRS_20260624_001",
  "assigned_at": "2026-06-24T14:30:00Z",
  "assigned_by": 100,
  "fire": {
    "event_id": "VIIRS_20260624_001",
    "latitude": -17.413,
    "longitude": -66.165,
    "confidence": "h",
    "frp": 45.2,
    "satellite": "NOAA-20",
    "acq_date": "2026-06-24",
    "acq_time": "1430"
  }
}
```

**Response 200 (sin incidencia):**
```json
{
  "active": false
}
```

**Uso en frontend:** `TeamsPage` consulta este endpoint al cargar. Si `active=true`, muestra banner "Incidencia activa asignada" con botón para navegar a `/team-safety`.

---

#### POST /api/v1/teams/:teamId/active-incident

Asigna manualmente el equipo a un incendio (activado desde el modal de incendio).

**Request:**
```json
{
  "incident_id": "VIIRS_20260624_001"
}
```

**Response 200:** misma estructura que GET con `active: true`.

---

#### DELETE /api/v1/teams/:teamId/active-incident

Desasigna el equipo de la incidencia activa.

**Response 200:**
```json
{
  "active": false
}
```

---

### 3.3 Perfil completo del usuario

Actualmente `AuthController.build()` reconstruye un `User` parcial (solo `id`, `fullName`, `email`). Se necesita un endpoint para obtener el perfil completo.

#### GET /api/v1/users/me

**Headers:** `Authorization: Bearer <token>`

**Response 200:**
```json
{
  "id": 123,
  "institution_id": 1,
  "team_id": 5,
  "full_name": "Juan Pérez",
  "email": "juan@example.com",
  "phone": "+591 77777777",
  "blood_type": "O+",
  "role": "COMMANDER",
  "years_experience": 5,
  "is_active": true,
  "duty_status": "off-duty"
}
```

**Uso:** llamado por `AuthController.build()` después del login o biometric, para poblar el objeto `User` con todos los campos.

---

## 4. Tablas de Base de Datos requeridas

### 4.1 users

| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | INTEGER PK | |
| institution_id | INTEGER FK | Institución a la que pertenece |
| team_id | INTEGER FK nullable | Equipo asignado |
| full_name | TEXT | Nombre completo |
| email | TEXT UNIQUE | Correo electrónico |
| password_hash | TEXT | Hash bcrypt |
| phone | TEXT nullable | Teléfono |
| blood_type | TEXT nullable | Tipo de sangre |
| role | TEXT | COMMANDER, SUPERADMIN, INSTITUTION_ADMIN, MEMBER, CIVILIAN |
| years_experience | INTEGER nullable | Años de experiencia |
| is_active | BOOLEAN | true por defecto |
| duty_status | TEXT | "on-duty" o "off-duty" |
| created_at | TIMESTAMP | |
| updated_at | TIMESTAMP | |

---

### 4.2 teams

| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | INTEGER PK | |
| name | TEXT | Nombre del equipo |
| is_active | BOOLEAN | true por defecto |
| created_at | TIMESTAMP | |
| updated_at | TIMESTAMP | |

---

### 4.3 assets (inventario)

| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | INTEGER PK | |
| institution_id | INTEGER FK | |
| callsign | TEXT | Código identificador (ej: "UNIDAD-01") |
| category | TEXT | Tipo de activo ("Camión cisterna", "Helicóptero", etc.) |
| status | TEXT | READY / IN_SERVICE / MAINTENANCE |
| water_capacity_liters | INTEGER nullable | Capacidad de agua en litros |
| fuel_level_percent | INTEGER nullable | Nivel de combustible 0-100 |
| last_known_lat | REAL nullable | Última ubicación lat |
| last_known_lng | REAL nullable | Última ubicación lng |
| created_at | TIMESTAMP | |
| updated_at | TIMESTAMP | |

---

### 4.4 fires (incendios satelitales)

| Columna | Tipo | Descripción |
|---------|------|-------------|
| event_id | TEXT PK | ID del evento (VIIRS/MODIS) |
| latitude | REAL | |
| longitude | REAL | |
| confidence | TEXT | h/n/l o numérico |
| temperature | REAL | Temperatura en Kelvin |
| humidity | REAL | Humedad % |
| wind | REAL | Velocidad del viento |
| frp | REAL | Fire Radiative Power (MW) |
| brightness | REAL | Brillo |
| scan | REAL | |
| track | REAL | |
| satellite | TEXT | Nombre del satélite |
| acq_date | TEXT | Fecha de adquisición (YYYY-MM-DD) |
| acq_time | TEXT | Hora UTC (HHMM) |
| daynight | TEXT | D/N |
| created_at | TIMESTAMP | |

**Nota:** Se asume que esta tabla se popula desde el `satellite-ingestor`. La app solo consume vía `/api/wildfire/v1/active`.

---

### 4.5 active_incidents (NUEVA — asignaciones de equipo)

| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | INTEGER PK | |
| team_id | INTEGER FK | Equipo asignado |
| incident_id | TEXT FK | ID del incendio (event_id en fires) |
| status | TEXT | "active", "completed", "cancelled" |
| assigned_by | INTEGER FK | Usuario que asignó |
| assigned_at | TIMESTAMP | |
| completed_at | TIMESTAMP nullable | |

---

### 4.6 personnel_locations (NUEVA — tracking GPS)

| Columna | Tipo | Descripción |
|---------|------|-------------|
| id | INTEGER PK | |
| user_id | INTEGER FK | |
| latitude | REAL | |
| longitude | REAL | |
| timestamp_ms | BIGINT | Unix timestamp en milisegundos |
| created_at | TIMESTAMP | |

**Usado por:** `POST /api/v1/personnel/location`.

---

## 5. Entidades del Frontend (estructuras Dart)

### 5.1 User (`lib/features/auth/domain/user_entity.dart`)

Campos: `id`, `institutionId`, `teamId`, `fullName`, `email`, `phone`, `bloodType`, `role`, `yearsExperience`, `isActive`, `dutyStatus`.

Acepta snake_case y camelCase en `fromJson`.

### 5.2 Fire (`lib/features/incidents/domain/fire_entity.dart`)

Campos: `eventId`, `latitude`, `longitude`, `confidence`, `temperature`, `humidity`, `wind`, `frp`, `brightness`, `scan`, `track`, `satellite`, `acqDate`, `acqTime`, `daynight`.

### 5.3 Asset (`lib/features/inventory/domain/asset_entity.dart`)

Campos: `id`, `institutionId`, `callsign`, `category`, `status`, `waterCapacityLiters`, `fuelLevelPercent`, `lastKnownLat`, `lastKnownLng`.

### 5.4 Team (`lib/features/teams/domain/team_entity.dart`)

Campos: `id`, `name`, `isActive`.

### 5.5 TeamMemberStatus (`lib/features/team_safety/domain/team_member_status.dart`)

Campos: `userId`, `fullName`, `location (LatLng?)`, `lastUpdate`, `lastMovementAt`, `status (active/still/danger/ok)`.

### 5.6 Route (`lib/features/routing/domain/route_entity.dart`)

Campos: `points (List<LatLng>)`, `distanceMeters`, `durationSeconds`.

### 5.7 TileKey (`lib/features/routing/domain/tile_key.dart`)

Grid de 0.5°: `TileKey(south: double, west: double)`, `fileName`, `neighbors()`.

---

## 6. Resumen de tareas pendientes

### 6.1 Backend (prioritario)

| # | Tarea | Prioridad |
|---|-------|-----------|
| 1 | Crear endpoint `GET /api/v1/routing/tiles/:tileKey` que sirva archivos SQLite | Alta |
| 2 | Ejecutar `tools/generate_road_graph.py` y subir los tiles | Alta |
| 3 | Crear tabla `active_incidents` y endpoints CRUD | Alta |
| 4 | Crear endpoint `GET /api/v1/users/me` con perfil completo | Alta |
| 5 | Crear tabla `personnel_locations` (si no existe) y verificar `POST /api/v1/personnel/location` | Media |
| 6 | Verificar que `POST /api/v1/auth/login` devuelve todos los campos del User (`phone`, `blood_type`, `role`, `years_experience`) | Media |

### 6.2 Frontend (faltante para completar features)

| # | Tarea | Estado |
|---|-------|--------|
| 1 | Integrar `GET /api/v1/users/me` en `AuthController.build()` para obtener perfil completo | Pendiente |
| 2 | Integrar `GET /api/v1/teams/:id/active-incident` en `TeamsPage` | Pendiente |
| 3 | Agregar tests unitarios y de widgets | Pendiente |
| 4 | Crear CI con GitHub Actions (flutter analyze + test + build) | Pendiente |
| 5 | Template de issue/PR y guía de contribución | Opcional |

### 6.3 Routing tiles — paso a paso

```bash
# 1. Generar tiles
cd tools
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python generate_road_graph.py
# Salida: tools/tiles/s17.0_w66.0.db, s17.0_w66.5.db, etc.

# 2. Subir al backend (ejemplo con scp/rsync)
rsync -av tools/tiles/ user@api.stuko.dev:/path/to/tiles/

# 3. Configurar el handler en el backend para servir /api/v1/routing/tiles/:tileKey
#    desde ese directorio
```

---

## 7. Datos esperados del backend vs lo que devuelve actualmente

| Endpoint | Campos que espera el frontend | Verificar |
|----------|------------------------------|-----------|
| POST /api/v1/auth/login | `token`, `user_id`, `full_name`, `email`, `phone`, `blood_type`, `role`, `years_experience`, `duty_status`, `team_id`, `institution_id`, `is_active` | ¿Devuelve todos? |
| GET /api/v1/teams/:id | `id`, `name`, `is_active` | OK (Fase 1) |
| GET /api/v1/teams/:id/users | `{ users: [...] }` con campos de User | OK |
| GET /api/wildfire/v1/active | `{ fires: [...] }` o array directo | OK |
| GET /api/v1/inventory/assets | `{ assets: [...] }` | OK |
| PATCH /api/v1/users/:id/status | acepta `{ duty_status }` | OK |
