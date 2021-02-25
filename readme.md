# API

> Importar la base de datos para su correcto funcionamiento

### Configuración de base de datos

` `app/config/dbConfig.js` `

``` 
{
    HOST: "localhost",
    USER: "postgres",
    PASSWORD: "cristian",
    DB: "sessons_music_db",
    PORT: 5433
}
```

### Credenciales

* correo: ``cris@gmail.com``
* clave: ``123456``

### Configuración de headers auth

> Agregar el **`x-access-token`** en la cabecera de la petición cuando se requiera autenticaión

``` 
x-access-token: el_token
```

### Endpoints

1. Endpoint login
    - POST
    - url: http://localhost:8080/api/auth/signin
    - body: ``` {"email": "string", "password": "string"} ```
    - example ```{"email": "cris@gmail.com","password": "123456"}```
2.  Endpoint obtener el listado de lecciones del usuario
    - GET
    - Require auth
    - url: http://localhost:8080/api/lessons

3.  Endpoint para obtener la lista de notas por lección
    - GET
    - Require auth
    - url: http://localhost:8080/api/lessons/notes/:idLesson
    - example: http://localhost:8080/api/lessons/notes/1

4. Endpoint para agregar notas a sus lecciones
    - POST
    - Require auth
    - url: http://localhost:8080/api/lessons/note
    - body: ``` {"idLesson": number, "note": "string"} ```
    - example: ``` {"idLesson": 1, "note": "Pronunciar correctamente"} ```

5. Endpoint para eliminar notas a sus lecciones
    - DELETE
    - Require auth
    - url: http://localhost:8080/api/lessons/note/:idNote
    - example: http://localhost:8080/api/lessons/note/1

5. Endpoint para cambiar el estado de las lecciones
    - PUT
    - Require auth
    - url: http://localhost:8080/api/lessons/:idLesson
    - body: ``` {"state": number } ```
    - example: ``` {"state": 2 } ```
    - values soport: 1 | 2 | 3

    
