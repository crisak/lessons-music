## Credenciales

* correo: ``cris@gmail.com``
* clave: ``123456``

### API

## Configuración de headers auth
> Agregar el **`x-access-token`** en la cabecera de la petición cuando se requiera autenticaión
```
x-access-token: el_token
```


## Endpoints

1. Endpoint login
    - POST
    - url: http://localhost:8080/api/auth/signin
    - body: ``` {"email": "cris@gmail.com", "password": "123456"} ```
2.  Endpoint obtener el listado de lecciones del usuario
    - GET
    - Require auth
    - url: http://localhost:8080/api/lessons

3.  Endpoint para obtener la lista de notas por lección
    - GET
    - Require auth
    - url: http://localhost:8080/api/lessons/notes/1
