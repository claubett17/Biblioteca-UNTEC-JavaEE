# Biblioteca Digital UNTEC
### Sistema de Gestión Empresarial en Java EE

Sistema de gestión de biblioteca digital desarrollado con Java EE, Servlets, JSP y JDBC, implementando el patrón de diseño MVC para una arquitectura robusta y escalable.

---

## 🎬 Demostración Técnica
A continuación, se presenta el recorrido funcional de la aplicación, detallando la arquitectura del código y el flujo de datos entre módulos.

[Ver Presentación en YouTube](https://youtu.be/fyiQixJgdBw)

---

## 🏛️ Arquitectura del Software
El sistema garantiza una separación estricta de responsabilidades mediante los siguientes componentes:

- **Capa de Modelo:** Implementación de entidades (POJOs) y persistencia aislada mediante el patrón DAO.
- **Capa de Vista:** Interfaces dinámicas en JSP procesadas con JSTL, eliminando el uso de scriptlets de Java.
- **Capa de Controlador:** Servlets encargados de la orquestación de peticiones HTTP y la administración de HttpSession.
- **Persistencia:** Gestión de base de datos mediante JDBC, optimizada con el patrón Singleton para la conexión a MySQL.

---

## 🔐 Credenciales de Acceso
Para facilitar la evaluación de los niveles de permisos, utilice los siguientes perfiles preconfigurados:

| Perfil | Identificador | Contraseña | Alcance |
| :--- | :--- | :--- | :--- |
| Administrador | admin@untec.cl | Admin1234! | Gestión total (CRUD) e Inventario |
| Estudiante | claudia@mail.com | 1234 | Consulta de catálogo y préstamos |

---

## 🎨 Experiencia de Usuario (UI/UX)
Interfaz de vanguardia inspirada en la tendencia Glassmorphism:

- **Efectos de Profundidad:** Uso de filtros de desenfoque y transparencias dinámicas.
- **Interactividad:** Buscadores en tiempo real desarrollados con JavaScript nativo.
- **Navegación Intuitiva:** Estructura optimizada para el usuario final.

---

## 🛠️ Stack Tecnológico
- **Backend:** Java 11/17 (Enterprise Edition)
- **Servidor:** Apache Tomcat 9.0+
- **Base de Datos:** MySQL 8.0
- **Frontend:** JSP, JSTL 1.2, CSS3 (Flexbox/Grid)
- **IDE:** Eclipse Enterprise Edition

---

## 🚀 Instalación y Despliegue
1. Esquema de Datos: Ejecutar el script localizado en /sql/schema.sql en MySQL.
2. Configuración: Actualizar credenciales en la clase Conexion.java (paquete utils).
3. Ejecución: Desplegar el archivo .WAR en Tomcat o ejecutar desde Eclipse.

4. Nota: Si su configuración local de MySQL tiene un usuario o contraseña distintos, por favor actualice las constantes USER y PASS en la clase ConexionDB.java antes de ejecutar.

---

## ✅ Entregables de la Evaluación
- Código fuente: Estructurado en paquetes siguiendo el patrón MVC.
- Script SQL: Archivo para la replicación total del entorno.
- Archivo ejecutable: Formato .WAR listo para despliegue.
- Documentación: README técnico y enlace a defensa en video.

---

**Proyecto desarrollado por Claudia Bettancourt**
Evaluación Proyecto Módulo 5 ABP 
Desarrollo de Aplicaciones Web Dinámicas
TALENTO DIGITAL / MARZO 2026
