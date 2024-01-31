## TaskVerse-Boilerplate - CI/CD Implementation 

## Introducción y objetivos:
Con el objetivo de llevar a cabo todo lo aprendido durante este Bootcamp (DevOps - GeeksHubs Academy), se ha implementado esta aplicación de tareas llamada TaskVerse. En la que que he aplicado todos los conocimientos adquiridos durante este Bootcamp. Tanto conocimientos relacionados con el Backend como el Frontend. Además, se ha creado un diagrama de secuencia que muestra el flujo de la aplicación desde que se produce una interacción por parte del usuario introducciendo una tarea hasta que se registra en la base de datos. 

Aprovecho para agradecer tanto a mis compañeros del bootcamp como a los docentes de la GeeksHubs Academy. ❤

## Clonación: TaskVerse-Boilerplate

Para clonar el proyecto, se pueden usar los siguientes comandos:
```
git clone https://github.com/alexanderfarias/TaskVerse-Boilerplate.git
cd TaskVerse-Boilerplate
docker compose up --build -d
```
Una vez levando el proyecto, procederemos a ejecutar el script `update_all_dependencies.sh` para actualizar todas las dependencias de la aplicación. Hay que tener en cuenta que este script requiere de +x para poder ejecutarse.

```
cd TaskVerse-Boilerplate
chmod +x update_all_dependencies.sh
./update_all_dependencies.sh
```
## Diagrama: TaskVerse-Boilerplate
Para poder ver mejor la secuencia de los pasos de la aplicación, he creado un diagrama de secuencia que muestra el flujo de la aplicación desde que el usuario introduce una tarea hasta que se registra en la base de datos. Pasando primero por la parte frontend donde el usuario introduce la tarea, y posteriormente por la parte backend donde se registra la tarea en la base de datos.

- [ ] En la parte Frontend, se ha desarrollado con [ReactJS](https://reactjs.org/) y desplegado con [Node Alpine](https://hub.docker.com/_/node), que es una imagen más ligera de node.
- [ ] En la parte Backend, se ha desarrollado con ExpressJS y desplegado con [Node Alpine](https://hub.docker.com/_/node), que es una imagen más ligera de node.
- [ ] La base de datos se ha desplegado con [MongoDB](https://www.mongodb.com/es) y se ha conectado con la librería [mongoose](https://mongoosejs.com/). La cual nos permite gestionar la persistencia de datos.
- [ ] Se ha configurado Keycloak como sistema de autenticación al acceder al portal (http://localhost:3000), primero redirige la petición a Keycloak para iniciar sesión y posteriormente a la aplicación.

```mermaid
sequenceDiagram
    title TaskVerse-Boilerplate - Sequence Diagram

    participant Usuario as Usuario (Frontend)
    participant API as Servidor API (Backend)
    participant MongoDB as MongoDB
    participant Keycloak as Keycloak
    participant MongoExpress as mongo-express

    Usuario ->> Keycloak: Accede al portal (http://localhost:3000)
    Keycloak -->> Usuario: Redirige a Keycloak para iniciar sesión

    Usuario ->> Keycloak: Inicia sesión en Keycloak
    Keycloak -->> Usuario: Autenticación exitosa

    Usuario ->> API: Envía una solicitud POST al endpoint /tasks con los detalles de la tarea.
    API -->> Usuario: Recibe la solicitud POST

    API ->> API: Valida los detalles de la tarea.
    API ->> API: Si son válidos, construye un nuevo objeto de tarea.
    API ->> MongoDB: Conecta a MongoDB usando mongoose.
    MongoDB ->> API: Conexión exitosa.
    API ->> MongoDB: Inserta el objeto de tarea en la colección de tareas en MongoDB.
    MongoDB -->> API: Inserción de tarea exitosa.

    API ->> MongoExpress: Permite acceso a mongo-express para ver y manipular los datos.
    MongoExpress -->> MongoDB: Conexión establecida con mongo-express.

    API -->> Usuario: Envía una respuesta con el código de estado 201 (Creado).

    Usuario -->> API: Recibe la respuesta.
    API -->> Usuario: Muestra un mensaje de éxito y la lista de tareas actualizada.
```

Este otro diagrama de secuencia muestra la secuencia de nuestra


## Criterios del proyecto.

- [X] La aplicación ha sido desarrollada con Node.js y ExpressJS.
- [X] Ofrece un sistema de integración continua (Haciendo uso del repositorio de Github)
- [X] La aplicación se encuentra dockerizada en diferentes contenedores necesarios para el funcionamiento de la aplicación (backend, frontend, base de datos, Keycloak, Grafana, Prometheus, etc).
- [X] Emplea el orquestrador docker-compose para la construcción de la aplicación.
- [X] Implementa un sistema automatizado de despliegue a través de pipelines con la herramienta Github Actions para construir, probar y desplegar la aplicación.
- [X] Incluye un panel de monitoreo de la aplicación gracias a la herramienta [Prometheus](https://prometheus.io/) (Recoge las metricas) junto con [Grafana](https://grafana.com/) (Visualiza los datos mediante Dashboards).
- [X] Es posible probar la aplicación en diferentes entornos (local, cloud, etc.).
- [x] Es posible configurar la base de datos y la autenticación para que funcione en diferentes entornos.

## Estructura: TaskVerse-Boilerplate

Para ello, hemos definido la siguiente estructura de carpetas y archivos: 

```
TaskVerse-Boilerplate
├── README.md
├── backend
│   ├── Dockerfile
│   ├── models
│   │   └── todo.js
│   ├── package-lock.json
│   ├── package.json
│   ├── routes
│   │   ├── index.js
│   │   └── todos.js
│   └── server.js
├── docker-compose.yml
└── frontend
    ├── Dockerfile
    ├── README.md
    ├── package-lock.json
    ├── package.json
    ├── public
    │   ├── favicon.ico
    │   ├── index.html
    │   ├── logo192.png
    │   ├── logo512.png
    │   ├── manifest.json
    │   └── robots.txt
    └── src
        ├── App.css
        ├── App.jsx
        ├── App.test.js
        ├── components
        │   ├── home.jsx
        │   ├── login.jsx
        │   └── todo-form.jsx
        ├── index.css
        ├── index.js
        ├── logo.svg
        ├── reportWebVitals.js
        └── setupTests.js
```
---

