# Arquitectura y Contenido de Vistas - Scarlet App

Este documento detalla el propósito, contenido y estado técnico de cada una de las vistas presentes en la aplicación Scarlet.

## Resumen General de Datos
- **Dinámico**: La mayoría de la lógica de negocio y datos de incendios, usuarios y equipos se consumen a través de APIs REST y se gestionan con Riverpod.
- **Hardcoded**: Principalmente etiquetas de interfaz (labels), estilos visuales, rutas de assets y configuraciones de mapas.

---

## 1. Shell (Contenedor Principal)
### Propósito
Actúa como el armazón principal de la aplicación autenticada, proporcionando una navegación persistente en la parte inferior (Bottom Navigation Bar) para alternar entre las funcionalidades principales sin perder el contexto.

### Contenido
- **Cuerpo (Body)**: Renderiza dinámicamente la sub-vista seleccionada (`MapPage`, `TeamsPage`, o `ProfilePage`).
- **Barra de Navegación**: Tres pestañas principales: Mapa, Equipos y Perfil.

### Estado de Contenido
- **Hardcoded**: Sí. Los destinos de navegación, iconos y etiquetas están definidos estáticamente en el código.

### Detalle Técnico y Componentes
| Componente | Tipo | Descripción | ¿Hardcoded? |
| :--- | :--- | :--- | :--- |
| `BottomNavigationBar` | UI Material | Control de navegación inferior con 3 items. | Sí (Labels e Iconos) |
| `GoRouter ShellRoute` | Lógica | Gestiona el stack de navegación y la persistencia del shell. | Sí (Rutas) |
| `_currentIndex` | Lógica | Determina el índice activo basándose en la ubicación de la URL. | Sí |

---

## 2. Login (Autenticación)
### Propósito
Permite a los usuarios autenticarse en el sistema mediante su correo electrónico y contraseña. Gestiona el flujo de entrada a la aplicación.

### Contenido
- **Identidad**: Logos de la aplicación y branding ("Cemento Base").
- **Formulario**: Campos de texto para correo y contraseña (este último aparece tras validar el correo).
- **Acciones**: Botón de "Continúa" / "Iniciar sesión".

### Estado de Contenido
- **Dinámico**: La validación de credenciales y el estado de carga (`isLoading`).
- **Hardcoded**: Textos de error, etiquetas de los campos, imágenes de assets y estilos.

### Detalle Técnico y Componentes
| Componente | Tipo | Descripción | ¿Hardcoded? |
| :--- | :--- | :--- | :--- |
| `TextField` (Email) | Input | Campo con filtrado de caracteres para correos. | Etiquetas y Regex |
| `TextField` (Pass) | Input | Campo oculto para la contraseña, visible condicionalmente. | Etiquetas y Regex |
| `ElevatedButton` | Acción | Ejecuta el método `login` del `authControllerProvider`. | Texto del botón |
| `Image.asset` | Media | Logos de Scarlet y Cemento Base. | Paths de assets |
| `SnackBar` | Feedback | Muestra errores de autenticación desde el controlador. | Estilos visuales |

---

## 3. Mapa de Incidentes (Dashboard)
### Propósito
Proporcionar una visualización geoespacial en tiempo real de los focos de incendio activos detectados por el sistema. Es la vista principal para la toma de decisiones tácticas.

### Contenido
- **Mapa Táctico**: Fondo oscuro (dark mode) con pines de calor.
- **Marcadores de Incendio**: Iconos circulares que cambian de color según la confianza/riesgo del incendio.
- **Detalle de Incendio**: Modal inferior (BottomSheet) con datos específicos (FRP, Satélite, Coordenadas).
- **Contador de Estado**: Overlay superior que indica el número total de incendios activos.

### Estado de Contenido
- **Dinámico**: Lista de incendios (`_fires`), ubicación del usuario (`_currentLocation`), contador de incendios.
- **Hardcoded**: Token de Mapbox, URL de los tiles, ubicación inicial (Cochabamba), lógica de colores por riesgo.

### Detalle Técnico y Componentes
| Componente | Tipo | Descripción | ¿Hardcoded? |
| :--- | :--- | :--- | :--- |
| `FlutterMap` | Mapa | Integración con Mapbox usando `TileLayer` oscuro. | Token y Tile URL |
| `MarkerLayer` (Fires) | Capa UI | Mapea la lista de `Fire` a iconos tácticos. | Lógica de colores |
| `MarkerLayer` (User) | Capa UI | Muestra el punto azul de la ubicación actual. | Color azul fijo |
| `ModalBottomSheet` | UI | Despliega detalles del objeto `Fire` seleccionado. | Labels de campos |
| `Timer.periodic` | Lógica | Actualiza los datos cada 30 minutos automáticamente. | Intervalo de tiempo |

---

## 4. Mi Equipo
### Propósito
Visualizar la estructura del equipo al que pertenece el usuario, el estado operativo de sus compañeros y sus roles dentro de la institución.

### Contenido
- **Tarjeta de Cabecera**: Nombre del equipo, estado (Activo/Inactivo) y estadísticas rápidas (miembros en servicio vs fuera).
- **Lista de Miembros**: Tarjetas individuales con nombre, rol, estado de servicio, grupo sanguíneo y años de experiencia.

### Estado de Contenido
- **Dinámico**: Datos del equipo y miembros obtenidos del `teamControllerProvider`.
- **Hardcoded**: Mapeo de nombres de roles (ej: "COMMANDER" -> "Comandante"), colores de roles, etiquetas de "En servicio".

### Detalle Técnico y Componentes
| Componente | Tipo | Descripción | ¿Hardcoded? |
| :--- | :--- | :--- | :--- |
| `_TeamHeaderCard` | Componente | Header con gradiente que resume el estado del equipo. | Gradientes y Labels |
| `_MemberCard` | Componente | Tarjeta de miembro con indicador de "TÚ" para el usuario actual. | Badge "TÚ" |
| `_StatChip` | UI | Pequeños indicadores de conteo en la cabecera. | Iconos y Etiquetas |
| `RefreshIndicator` | Acción | Permite recargar la lista de miembros manualmente. | Color del spinner |

---

## 5. Mi Perfil
### Propósito
Permitir al usuario gestionar su disponibilidad operativa (En servicio / Fuera de servicio) y visualizar sus datos personales registrados.

### Contenido
- **Perfil**: Avatar circular, nombre completo y rol.
- **Switch de Estado**: Botón animado de gran tamaño para cambiar el estado de disponibilidad.
- **Información Personal**: Tarjetas con email, teléfono, tipo de sangre y experiencia.
- **Acción de Cierre**: Botón para cerrar sesión.

### Estado de Contenido
- **Dinámico**: Datos del usuario desde `authControllerProvider` y estado de servicio desde `dutyStatusProvider`.
- **Hardcoded**: Iconos de las tarjetas de información y etiquetas.

### Detalle Técnico y Componentes
| Componente | Tipo | Descripción | ¿Hardcoded? |
| :--- | :--- | :--- | :--- |
| `AnimatedContainer` | UI | El botón de estado cambia de color (verde/rojo) y texto suavemente. | Textos de estado |
| `_buildInfoTile` | Componente | Constructor de filas de información con iconos consistentes. | Iconos y Labels |
| `OutlinedButton.icon` | Acción | Botón de "Cerrar sesión" con confirmación de redirección. | Color rojo y Texto |
| `CircleAvatar` | UI | Placeholder del usuario con color corporativo. | Color naranja fijo |
