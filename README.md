# 📚 Biblioteca Digital UNTEC
### Sistema de Gestión de Administración de Biblioteca de la Universidad Untec con Jakarta EE & Maven

Desarrollado con **Java 17**, **Jakarta Servlets** y **JSP**, utilizando **Maven** para la gestión de dependencias y siguiendo el patrón de arquitectura **MVC**.

---

## 🎬 Demostración Técnica
Recorrido funcional de la aplicación, arquitectura del código y flujo de datos.

> **[Ver Presentación en YouTube](https://youtu.be/fyiQixJgdBw)**
* **Repositorio GitHub:** [https://github.com/claubett17/Biblioteca-UNTEC-JavaEE](https://github.com/claubett17/Biblioteca-UNTEC-JavaEE)
---

## 🏛️ Arquitectura y Tecnologías
La solución implementa una separación estricta de responsabilidades:

- **Backend:** Java 17 con Jakarta EE (Servlets & JSP).
- **Seguridad:** Encriptación de contraseñas mediante **BCrypt**.
- **Capa de Datos:** Acceso mediante **JDBC** con el patrón DAO y Singleton.
- **Gestión:** **Maven** para dependencias y empaquetado del ciclo de vida.
- **Frontend:** JSP con **JSTL** para una lógica de vista limpia (sin scriptlets).

---

## 🔐 Credenciales de Acceso

Para evaluar los diferentes niveles de privilegios en el sistema, utilice los siguientes perfiles preconfigurados (asegúrese de haber ejecutado el script SQL previamente):

Perfil Administrador
Usuario: admin@untec.cl

Contraseña: Admin1234!

Alcance: Acceso total al panel de control, gestión de inventario (CRUD de libros), administración de usuarios y revisión de historiales.

Perfil Estudiante 
Usuario: claudia@mail.com

Contraseña: 1234

Alcance: Interfaz simplificada para consulta de catálogo, búsqueda de ejemplares y solicitudes y devoluciones.

---


## 🛠️ Stack Tecnológico
- **Lenguaje:** Java 17
- **Servidor:** Apache Tomcat 10.1+
- **Base de Datos:** MySQL 8.0
- **Dependencias:** Jakarta Servlets, JSTL, MySQL Connector, BCrypt.
- **IDE:** Eclipse Enterprise Edition.

---

## 📂 Estructura del Proyecto
El sistema sigue la estructura estándar de un proyecto Maven con arquitectura MVC:

```text
biblioteca-untec1/
├── src/main/java/
│   ├── com.untec.controller/    # Servlets (Controlador)
│   ├── com.untec.model.dao/     # Acceso a Datos (DAO)
│   ├── com.untec.model.entity/  # Clases POJO (Modelo)
│   └── com.untec.util/          # Conexión DB y Utilidades (BCrypt)
├── src/main/webapp/
│   ├── views/                  # Archivos JSP (Vistas)
│   ├── assets/                 # CSS (Glassmorphism), JS y Imágenes
│   └── WEB-INF/                # Configuración (web.xml)
├── sql/                        # Script de Base de Datos
│   └── biblioteca_db.sql
├── pom.xml                     # Gestión de dependencias Maven
└── README.md                   # Documentación del proyecto 
```

---

## 🚀 Instalación y Despliegue
1. **Base de Datos:** Ejecutar el script en `/sql/biblioteca_db.sql` en su instancia de MySQL.
2. **Dependencias:** Al ser un proyecto **Maven**, ejecutar `Maven Install` para descargar las librerías necesarias.
3. **Servidor:** Desplegar en **Apache Tomcat 10**. (Importante: Usa el namespace `jakarta.*`).
4. **Ejecución:** Acceder vía `http://localhost:8080/biblioteca-untec

---

## ✅ Entregables
- Código fuente (Estructura Maven/MVC).
- Script SQL para replicación total.
- Archivo ejecutable (.WAR).
- Documentación técnica y video de presentación.

---

## 👨‍💻 Desarrollado por

**Claudia Bettancourt** — *Evaluación Módulo #5 ABP / Desarrollo de Aplicaciones Web Dinámicas /* 
**TALENTO DIGITAL / MARZO 2026**
