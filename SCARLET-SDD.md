**SDD Técnico: Scarlet App (Mobile)**

> *Documento técnico que describe la arquitectura, funcionamiento, componentes y uso de la aplicación móvil táctica de Scarlet Initiative.*

---

### **1. Nombre del Sistema**
**Scarlet App (Mobile)**

### **2. Descripción**
`Scarlet` es la **aplicación móvil táctica** diseñada para el personal operativo en el terreno (Bomberos, Brigadistas, Comandantes). Proporciona capacidades críticas de visualización de incidentes geolocalizados, actualización de estados de disponibilidad (Duty Status), recepción de notificaciones de despacho de misiones (Push/NATS) y emisión de telemetría en tiempo real.

Está construida para ser resiliente, rápida y capaz de funcionar bajo el ecosistema de microservicios de Scarlet a través del Envoy Gateway.

---

### **3. Arquitectura General**

El proyecto sigue una arquitectura **Feature-First Clean Architecture**, garantizando alta cohesión y bajo acoplamiento.

```text
+---------------------------------------------------+
|                  Capa de Presentación             |
|  (Flutter Widgets + Riverpod State Management)    |
+-------------------------+-------------------------+
                          |
+-------------------------v-------------------------+
|                    Capa de Dominio                |
|       (Entidades Freezed + Interfaces / Ports)    |
+-------------------------+-------------------------+
                          |
+-------------------------v-------------------------+
|                     Capa de Datos                 |
| (Implementación de Repositorios + Dio HTTP Client)|
+-------------------------+-------------------------+
                          |
+-------------------------v-------------------------+
|                  Envoy API Gateway                |
+---------------------------------------------------+
```

#### Componentes Clave:
| Componente | Función |
|---------|--------|
| **`lib/core/`** | Infraestructura base: cliente HTTP (`dio`), enrutamiento global (`go_router`), almacenamiento seguro de tokens y tema visual. |
| **`lib/features/`** | Módulos funcionales aislados (auth, incidents, personnel, teams). Cada uno contiene su propia tríada `data/`, `domain/` y `presentation/`. |
| **`pubspec.yaml`** | Gestión de dependencias, donde destacan Riverpod, GoRouter, Dio y Flutter Map. |
| **Generación de Código** | Uso de `build_runner` con `freezed` y `riverpod_generator` para asegurar inmutabilidad y eliminar boilerplate. |

---

### **4. Flujo de Datos y Ejecución**

1.  **Interacción de Usuario:** El usuario interactúa con la UI (ej. botón "En Camino").
2.  **Gestión de Estado:** El Widget notifica al `AsyncNotifier` (Riverpod Provider).
3.  **Invocación de Dominio:** El Provider llama al método correspondiente en el Repositorio (Capa de Dominio).
4.  **Capa de Datos:** La implementación del repositorio utiliza el cliente `Dio` (Capa Core) para realizar la petición HTTP.
5.  **Intercepción:** El `AuthInterceptor` adjunta el JWT.
6.  **Red:** La petición llega al `scarlet-gateway`, que la transcodifica a gRPC y la enruta al microservicio correspondiente.
7.  **Respuesta:** El flujo se invierte y la UI reacciona al nuevo estado (ej. de `loading` a `data`).

---

### **5. Integración con Servicios**

| Servicio (vía Gateway) | Funcionalidad en la App |
|--------|--------------|
| `personnel-service` | Login, gestión de perfil, actualización de estado (on-duty) y emisión de ubicación (telemetría). |
| `dispatch-service` | Recepción de órdenes de misión y confirmación de llegada a la escena. |
| `wildfire-tracking` | Visualización de polígonos de incendio e incidentes en el mapa táctico (`flutter_map`). |

---

### **6. Tecnologías y Estándares**

| Tecnología | Uso |
|----------|-----|
| **Flutter / Dart** | SDK multiplataforma para UI nativa. |
| **Riverpod** | Inyección de dependencias reactiva y gestión de estado asíncrono. |
| **GoRouter** | Enrutamiento declarativo y deep linking protegido. |
| **Dio** | Cliente HTTP avanzado para intercepción y llamadas REST. |
| **Freezed** | Clases de datos inmutables y uniones (unions) seguras. |

---

### **7. Instalación y Despliegue**

#### Requisitos:
- Flutter SDK (>=3.3.0)
- Android Studio / Xcode configurados

#### Pasos:

1. **Clonar el repositorio y entrar al directorio:**
```bash
git clone <repo_url>
cd Scarlet
```

2. **Instalar dependencias:**
```bash
flutter pub get
```

3. **Generar código (Riverpod, Freezed):**
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **Ejecutar la aplicación:**
```bash
flutter run
```

---

### **8. Uso y Pruebas**

#### Casos de Uso Principales:
- **Autenticación:** Login seguro con JWT almacenado en `flutter_secure_storage`.
- **Mapa Táctico:** Visualización de incidentes y posición actual.
- **Reporte de Estado:** Cambio rápido de disponibilidad para el centro de mando.

#### Pruebas Recomendadas:
- Pruebas unitarias para los repositorios (`flutter test`).
- Verificación del comportamiento del router al expirar el token (redirección al login).

---

### **9. Documentación y Soporte**

#### 📚 Documentación:
- **Skills de Agentes** → Revisa `docs/skills/flutter-core-infra.md` y `docs/skills/flutter-feature-dev.md` en el repositorio principal para las normas arquitectónicas.
- **Configuración** → `pubspec.yaml` y `.env` (para variables de entorno).

---

### **10. Contribución y Desarrollo**
- Estrictamente prohibido cruzar dependencias entre Features.
- Toda nueva entidad debe ser inmutable (`@freezed`).
- La UI no debe realizar peticiones HTTP directas (siempre usar Providers y Repositorios).

---

### **11. Licencia**
Licencia: **MIT**

---

### **12. Actualizaciones Futuras (Roadmap)**
| Categoría | Propuesta |
|--------|----------|
| **Telemetría** | Implementar background tasks para envío continuo de ubicación incluso con la app cerrada. |
| **Notificaciones** | Integración nativa con ntfy para recepción de alertas push críticas. |
| **Offline First** | Caché local con SQLite/Isar para zonas sin cobertura móvil. |
