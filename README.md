TaskVerse-Boilerplate - Tasks Application - CI/CD Implementation for automated testing and deployment

Se trata de una implementación de CI/CD para automatizar las pruebas y el despliegue de mi aplicación la cual permite al usuario interactuar con la aplicación creando tareas y registrandolas en una base de datos MongoDB con la librería [mongoose](https://mongoosejs.com/) que se encarga de la persistencia de los datos. 


---
## Estructura de directorios.

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
## Diagrama de secuencia
```mermaid
sequenceDiagram
    participant Frontend
    participant Backend
    participant Server
    participant Database

    Frontend->>Backend: Petición HTTP
    Backend->>Server: Procesar solicitud
    Server->>Database: Consulta a la base de datos
    Database-->>Server: Respuesta de la base de datos
    Server-->>Backend: Respuesta procesada
    Backend-->>Frontend: Respuesta HTTP
```

---
## Descripción
A demonstration of Docker to implement a simple 3 tier architecture

* frontend will be able to access the mid-tier
* mid-tier will be able to access the db

In order to run this in docker, simply type ```docker-compose up``` at the command prompt. Docker will then create the [MongoDB](https://www.mongodb.com/) from the stock [mongo](https://hub.docker.com/_/mongo) image. The api uses [nodejs](https://nodejs.org/) with [express](http://expressjs.com/) and is built from a [node:alpine](https://hub.docker.com/_/node) image. The front end uses [ReactJS](https://reactjs.org/) and built from a [node:alpine](https://hub.docker.com/_/node) image.