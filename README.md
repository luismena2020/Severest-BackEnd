# QA Automation Backend Challenge - ServeRest API con Karate DSL

## Descripción

Este proyecto contiene una suite de pruebas automatizadas para la API de Usuarios de ServeRest utilizando Karate DSL.

Se validan las operaciones CRUD de usuarios:

* GET /usuarios
* POST /usuarios
* GET /usuarios/{_id}
* PUT /usuarios/{_id}
* DELETE /usuarios/{_id}

La automatización incluye validaciones funcionales, validaciones de esquema JSON, manejo de datos dinámicos y escenarios positivos y negativos.

---

## Tecnologías Utilizadas

* Java 17
* Maven 3.9+
* Karate DSL 1.5.1
* JUnit 5

---

## Requisitos Previos

Verificar las versiones instaladas:

```bash
java -version
mvn -version
```

Versiones recomendadas:

```text
Java 17
Apache Maven 3.9+
```

---

## Instalación

### Clonar el repositorio

```bash
git clone https://github.com/usuario/karate-serverest-api.git
```

### Ingresar al proyecto

```bash
cd karate-serverest-api
```

### Descargar dependencias

```bash
mvn clean install
```

---

## Estructura del Proyecto

```text
karate-serverest-api
│
├── src
│   └── test
│       └── java
│           │
│           ├── features
│           │   └── usuarios
│           │       ├── getUsuarios.feature
│           │       ├── createUsuario.feature
│           │       ├── getUsuarioById.feature
│           │       ├── putUsuario.feature
│           │       └── deleteUsuario.feature
│           │
│           ├── helpers
│           │   ├── usuario-generator.js
│           │   └── schemas.js
│           │
│           ├── runners
│           │   └── TestRunner.java
│           │
│           └── karate-config.js
│
├── pom.xml
├── README.md
└── target
```

---

## Configuración

La URL base se configura en:

```javascript
function fn() {
    return {
        baseUrl: 'https://serverest.dev'
    };
}
```

---

## Ejecución de Pruebas

### Ejecutar todas las pruebas

```bash
mvn test
```

### Ejecutar una feature específica

```bash
mvn test -Dkarate.options="classpath:features/usuarios/getUsuarios.feature"
```

### Ejecutar por tags

```gherkin
@smoke
Scenario: Obtener usuarios
```

```bash
mvn test -Dkarate.options="--tags @smoke"
```

---

## Casos de Prueba Implementados

### GET /usuarios

#### Positivos

* Obtener lista de usuarios
* Validar estructura de respuesta
* Validar cantidad de usuarios

---

### POST /usuarios

#### Positivos

* Crear usuario con datos válidos

#### Negativos

* Crear usuario con email duplicado
* Validar campos obligatorios

---

### GET /usuarios/{id}

#### Positivos

* Buscar usuario existente

#### Negativos

* Buscar usuario inexistente

---

### PUT /usuarios/{id}

#### Positivos

* Actualizar usuario existente

#### Negativos

* Actualizar usuario inexistente
* Validar campos obligatorios

---

### DELETE /usuarios/{id}

#### Positivos

* Eliminar usuario existente

#### Negativos

* Eliminar usuario inexistente

---

## Validación de Esquemas

Los contratos JSON se centralizan en:

```text
helpers/schemas.js
```

Ejemplo:

```javascript
var usuarioSchema = {
    nome: '#string',
    email: '#string',
    password: '#string',
    administrador: '#string',
    _id: '#string'
};
```

---

## Generación de Datos de Prueba

Se utiliza un generador dinámico para evitar colisiones de email:

```javascript
function() {

    var timestamp = new Date().getTime();

    return {
        nome: 'Usuario ' + timestamp,
        email: 'usuario' + timestamp + '@mail.com',
        password: '123456',
        administrador: 'true'
    };
}
```

---

## Reportes

Después de ejecutar las pruebas, Karate genera reportes automáticamente.

Ubicación:

```text
target/karate-reports/
```

Abrir:

```text
target/karate-reports/karate-summary.html
```

El reporte incluye:

* Casos ejecutados
* Casos exitosos
* Casos fallidos
* Request y Response
* Tiempo de ejecución
* Logs

---

## Estrategia de Automatización

### Independencia de Pruebas

Cada escenario genera sus propios datos para evitar dependencias entre pruebas.

### Reutilización

Se utilizan:

* Generadores de datos
* Schemas compartidos
* Configuración centralizada

### Cobertura

La suite cubre:

* Operaciones CRUD completas
* Casos positivos
* Casos negativos
* Validaciones funcionales
* Validaciones de contrato

### Mantenibilidad

La solución se organiza por funcionalidades y permite escalar fácilmente a nuevos endpoints de ServeRest.

---

## Autor

Nombre: Luis Mena

Fecha: Junio 2026
