# QA Automation Challenge - ServeRest API

## Descripción

Proyecto de automatización QA BackEnd utilizando Karate DSL para validar los endpoints CRUD de usuarios de la API ServeRest.

La suite incluye:

* Validaciones funcionales
* Casos positivos y negativos
* Validaciones de esquema JSON
* Generación dinámica de datos
* Organización modular y reutilizable

---

# Tecnologías Utilizadas

* Java 17
* Maven
* Karate DSL
* JUnit 5
* GitHub Actions (opcional)

---

# API Utilizada

https://serverest.dev/

Documentación:
https://serverest.dev/

---

# Estructura del Proyecto

```bash
qa-karate-serverest/
│
├── pom.xml
├── karate-config.js
├── README.md
│
├── src/test/java
│   ├── runners/
│   │   └── TestRunner.java
│   │
│   ├── features/
│   │   └── usuarios/
│   │       ├── getUsuarios.feature
│   │       ├── postUsuario.feature
│   │       ├── getUsuarioById.feature
│   │       ├── putUsuario.feature
│   │       └── deleteUsuario.feature
│   │
│   ├── schemas/
│   │   ├── usuarioSchema.json
│   │   └── usuariosListSchema.json
│   │
│   ├── helpers/
│   │   └── DataGenerator.js
│   │
│   └── utils/
│       └── common.feature
│
└── target/
```

---

# Requisitos Previos

Antes de ejecutar el proyecto instalar:

* Java 17+
* Maven 3.9+
* Git

Verificar instalación:

```bash
java -version
mvn -version
git --version
```

---

# Instalación del Proyecto

## 1. Clonar repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
```

## 2. Ingresar al proyecto

```bash
cd qa-karate-serverest
```

## 3. Instalar dependencias

```bash
mvn clean install
```

---

# Ejecución de Tests

## Ejecutar todos los tests

```bash
mvn test
```

## Ejecutar un feature específico

```bash
mvn test -Dkarate.options="classpath:features/usuarios/getUsuarios.feature"
```

## Ejecutar 

Ir TestRunner.java y cambiar
return Karate.run(
"classpath:features/usuarios/getUsuarios.feature"
);
---en este caso getUsuarios.feature  es el nombre del  feature que 
queremos ejecutar y podemos cambiarlo por getUsuarioById,postUsuario ,etc

# Reportes

Karate genera automáticamente reportes HTML en:

```bash
target/karate-reports/
```

Abrir:

```bash
karate-summary.html
```

---

# Cobertura de Pruebas

## Endpoints cubiertos

| Método | Endpoint       | Descripción        |
| ------ | -------------- | ------------------ |
| GET    | /usuarios      | Obtener usuarios   |
| POST   | /usuarios      | Registrar usuario  |
| GET    | /usuarios/{id} | Buscar usuario     |
| PUT    | /usuarios/{id} | Actualizar usuario |
| DELETE | /usuarios/{id} | Eliminar usuario   |

---

# Casos Positivos

* Obtener lista de usuarios
* Crear usuario válido
* Buscar usuario existente
* Actualizar usuario existente
* Eliminar usuario existente

---

# Casos Negativos

* Crear usuario duplicado
* Buscar usuario inexistente
* Actualizar usuario inexistente
* Eliminar usuario inexistente
* Validaciones de datos inválidos

---

# Estrategia de Automatización

La automatización fue diseñada utilizando una arquitectura modular y reusable.

## Principios aplicados

* DRY (Don't Repeat Yourself)
* Reutilización de componentes
* Separación por responsabilidades
* Independencia de escenarios
* Datos dinámicos para evitar colisiones

## Patrones utilizados

*POM


---

# Autor

Nombre: Luis Mena
---

# Recursos Oficiales

Karate DSL:
https://karatelabs.github.io/karate/

ServeRest:
https://serverest.dev/

JUnit 5:
https://junit.org/junit5/
