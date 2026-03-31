# Biblioteca-UNTEC
Sistema de gestión de biblioteca digital desarrollado con Java EE, Servlets, JSP y JDBC siguiendo el patrón MVC.

🎬 Demostración Técnica:

A continuación, se presenta el recorrido funcional de la aplicación, detallando la arquitectura del código y el flujo de datos entre módulos.
Ver Presentación en YouTube

🏛️ Arquitectura del Software:
El sistema ha sido desarrollado bajo el patrón Modelo-Vista-Controlador (MVC), garantizando una separación estricta de responsabilidades y facilitando el mantenimiento a largo plazo.

Componentes de la SoluciónCapa de Modelo: Implementación de entidades (POJOs) y persistencia aislada mediante el patrón DAO.

Capa de Vista: Interfaces dinámicas en JSP procesadas con JSTL, eliminando el uso de scriptlets de Java para mantener la limpieza del código.

Capa de Controlador: Servlets encargados de la orquestación de peticiones HTTP y la administración segura de la HttpSession.

Persistencia: Gestión de base de datos mediante JDBC, optimizada con el patrón Singleton para la conexión a MySQL.

🔐 Credenciales de Acceso:

Para facilitar la evaluación de los diferentes niveles de permisos, utilice los siguientes perfiles:

Perfil Identificador Administrador: admin@untec.cl, contraseña admin1234!
Gestión total (CRUD), Historial y Control de Inventario

Perfil Estudiante/Usuario:  claudia@mail.com, contraseña 1234 
Consulta de catálogo y solicitudes de préstamo

🎨 Experiencia de Usuario (UI/UX):
Se ha implementado una interfaz de vanguardia inspirada en el Glassmorphism, Efectos de Profundidad: Uso de filtros de desenfoque (backdrop-filter) y transparencias dinámicas.
Interactividad: Buscadores en tiempo real desarrollados con JavaScript nativo.
Navegación Intuitiva: Estructura optimizada para minimizar la curva de aprendizaje de los usuarios.

🛠️ Stack TecnológicoBackend: 
Java 11/17 (Enterprise Edition)
Servidor: Apache Tomcat 9.0+
Base de Datos: MySQL 8.0Frontend: JSP, JSTL 1.2, 
CSS3 (Flexbox/Grid)IDE: Eclipse Enterprise Edition

🚀 Instalación y Despliegue:
Esquema de Datos: Ejecutar el script localizado en /sql/schema.sql en su instancia de MySQL.

Configuración: Actualizar las credenciales de conexión en la clase Conexion.java (paquete utils).

Ejecución: Desplegar el archivo .WAR en el directorio webapps de Tomcat o ejecutar el proyecto directamente desde Eclipse.

✅ Entregables de la Evaluación:
Código fuente estructurado en paquetes.Script SQL para la replicación del entorno.
Archivo ejecutable .WAR.
Documentación técnica y enlace a video.

Proyecto desarrollado por Claudia Bettancourt para la evaluación del proyecto para el Módulo # 5 ABP / Desarrollo de Aplicaciones Web Dinámicas
TALENTO DIGITAL / MARZO 2026
