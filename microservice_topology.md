# Plantilla Base para Microservicios Scarlet

Esta guía define la estructura estándar, configuración y herramientas necesarias para crear un nuevo microservicio backend para el proyecto **Scarlet**, tomando como referencia la arquitectura base de `personnel-service`.

## 1. Estructura de Directorios (Clean Architecture)

El proyecto debe estar dividido en dominios y capas de la siguiente manera:

```text
├── .gitlab-ci.yml          # Pipeline CI/CD en GitLab
├── Dockerfile              # Construcción de la imagen del contenedor
├── cmd/
│   └── server/
│       └── main.go         # Punto de entrada exclusivo del servidor gRPC
├── internal/
│   ├── core/               # Lógica compartida, utilerías, autenticación/JWT
│   ├── handlers/           # Implementación de las interfaces gRPC
│   ├── messaging/          # Adaptadores para eventos y mensajería (Ej: NATS)
│   ├── repositories/       # Conexiones a BD y Caché (PostgreSQL, Redis)
│   ├── services/           # Lógica de negocio core (Casos de uso)
│   └── telemetry/          # Instrumentación y métricas de Prometheus
├── protos/                 # Definición de contratos, enums y payloads (.proto)
├── proto_descriptor.pb     # Descriptor compilado de protobuf
├── go.mod
└── go.sum
```

## 2. Compilación de Protocol Buffers y Descriptor

Para exponer y documentar correctamente los contratos de gRPC (así como facilitar introspección o transcoding), se deben compilar los archivos `.proto` en código Go y generar el **descriptor unificado (`proto_descriptor.pb`)**.

**Comando base (usando `protoc`):**

```bash
protoc --go_out=. \
  --go-grpc_out=. \
  --descriptor_set_out=proto_descriptor.pb \
  --include_imports \
  protos/*.proto
```

> [!IMPORTANT]  
> Asegúrate de ejecutar este comando cada que modifiques un archivo `.proto`, y realizar un `commit` del archivo `proto_descriptor.pb` resultante para asegurar la sincronía con tu infraestructura.

---

## 3. Código Base del Servidor (`cmd/server/main.go`)

Este archivo es el punto de arranque del microservicio. La arquitectura indica que sólo existirá un binario servidor. Este archivo orquestará:
1. La lectura de las variables de entorno de infraestructura.
2. Inyección de repositorios, bases de datos, buses de eventos y servicios.
3. Exposición de las **Métricas de Prometheus** en un puerto secundario.
4. Activación del **Servidor gRPC** e interceptores de autenticación.

```go
package main

import (
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	// IMPORTANTE: Ajustar paths correspondientes al paquete local
	// "scarlet-initiative/domain/nuevo-microservicio/internal/handlers"
	// "scarlet-initiative/domain/nuevo-microservicio/internal/telemetry"
	// pb "scarlet-initiative/domain/nuevo-microservicio/protos"
)

const port = ":50051"

func main() {
	log.Println("Iniciando Servicio Backend (gRPC)...")

	// ============================================================
	// 1. INICIALIZAR INFRAESTRUCTURA (DB, Redis, NATS, etc)
	// ============================================================
	// Ejemplo: Configurar DB Postgres y test de ping...

	// ============================================================
	// 2. INYECTAR REPOSITORIOS, SERVICIOS Y HANDLERS
	// ============================================================
	// repo := repositories.New...(db)
	// svc := services.New...(repo)
	// handler := handlers.NewGRPCHandler(svc)

	// ============================================================
	// 3. EXPOSICIÓN DE MÉTRICAS (PROMETHEUS)
	// ============================================================
	metricsPort := os.Getenv("SERVER_METRICS_PORT")
	if metricsPort == "" {
		metricsPort = ":2112"
	}
	
	// Levantar paralelamente el servidor de métricas local
	// go telemetry.StartMetricsServer(metricsPort)

	// ============================================================
	// 4. INICIAR SERVIDOR gRPC
	// ============================================================
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("Error al abrir el puerto: %v", err)
	}

	grpcServer := grpc.NewServer(
		// grpc.UnaryInterceptor(handlers.AuthInterceptor(jwtMgr)), // Hook opcional de token
	)

	// pb.Register[MiServicio]Server(grpcServer, handler)
	reflection.Register(grpcServer) // Habilita Server Reflection (util para grpcurl/Postman)

	go func() {
		log.Printf("Servidor gRPC escuchando en el puerto %s", port)
		if err := grpcServer.Serve(lis); err != nil {
			log.Fatalf("Error en el servidor gRPC: %v", err)
		}
	}()

	// Graceful Shutdown
	stop := make(chan os.Signal, 1)
	signal.Notify(stop, syscall.SIGINT, syscall.SIGTERM)
	<-stop

	log.Println("Apagando el servidor elegantemente...")
	grpcServer.GracefulStop()
}
```

---

## 4. Archivo `Dockerfile`

El microservicio utiliza un modelo de construcción *Multi-Stage* de Docker que resulta en una imagen en extremo ligera basada en Alpine. **Contiene únicamente el binario unificado del servidor** y excluye subprocesos paralelos (como el `telemetry-worker`).

```dockerfile
# Etapa 1: Construcción (Builder)
FROM golang:1.25-alpine AS builder

# Instalar dependencias para compilar
RUN apk add --no-cache git
WORKDIR /app

# Aprovechar capa de caché descargando go.mod/sum y dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copiar el root
COPY . .

# Compilación estática exclusiva del Servidor gRPC
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /bin/server ./cmd/server

# Etapa 2: Imagen Final (Ultraligera)
FROM alpine:latest  

# Añadir certificaciones CA por si se hacen peticiones salientes
RUN apk --no-cache add ca-certificates tzdata

WORKDIR /root/

# Extraer el binario servidor compilado desde la etapa "builder"
COPY --from=builder /bin/server .

# Exponer puertos: (1) Servidor gRPC, (2) Envío de Métricas Prometheus
EXPOSE 50051 2112

# Comando CMD predeterminado: arrancar el servidor
CMD ["./server"]
```

---

## 5. Pipeline CI/CD (`.gitlab-ci.yml`)

Este pipeline utiliza GitLab-CI para escanear en busca de secretos de seguridad de forma predeterminada y, al publicarse un *Tag*, compila y pushea la imagen al Docker Registry. Toma en cuenta la nomenclatura estándar para el etiquetado de la imagen (ej: `stuk0o/scarlet-[servicio]`).

```yaml
stages:
  - test
  - secret-detection
  - publish

sast:
  stage: test

include:
  - template: Security/SAST.gitlab-ci.yml
  - template: Security/Secret-Detection.gitlab-ci.yml

variables:
  SECRET_DETECTION_ENABLED: 'true'

secret_detection:
  stage: secret-detection

docker_build_and_push:
  stage: publish
  image: docker:24.0.5
  services:
    - docker:24.0.5-dind
  variables:
    DOCKER_TLS_CERTDIR: "/certs"
  rules:
    - if: $CI_COMMIT_TAG
  script:
    # Autenticarse contra el Docker Registry utilizando variables CI/CD
    - echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
    
    # Construir imagen aplicando el Tag al Microservicio
    # EJEMPLO MENCIONADO: docker build -t stuk0o/scarlet-wildfire-tracking:v1.0.0 .
    - docker build -t "$DOCKER_USERNAME/scarlet-[microservicio]:${CI_COMMIT_TAG}" .
    - docker push "$DOCKER_USERNAME/scarlet-[microservicio]:${CI_COMMIT_TAG}"
```
