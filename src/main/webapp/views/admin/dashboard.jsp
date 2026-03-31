<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Biblioteca Untec - Administrador </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body { height: 100%; font-family: 'Poppins', sans-serif; background: #000; overflow-x: hidden; }
        
        .bg-fixed {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000') no-repeat center center;
            background-size: cover;
            z-index: 0;
        }

        .overlay-master {
            position: relative; z-index: 1; min-height: 100vh;
            background: rgba(0, 0, 0, 0.75);
            display: flex; flex-direction: column;
        }

        .navbar {
            position: sticky; top: 0; width: 100%;
            background: rgba(20, 20, 20, 0.6); 
            backdrop-filter: blur(25px) saturate(150%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 50px;
            display: flex; justify-content: space-between; align-items: center;
            z-index: 1000;
        }

        .container { width: 95%; max-width: 1200px; margin: 50px auto; }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        /* TARJETAS CONVERTIDAS EN ENLACES */
        .stat-link { text-decoration: none; color: inherit; display: block; }

        .stat-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 25px;
            display: flex;
            align-items: center;
            gap: 15px;
            backdrop-filter: blur(15px);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        /* Efecto de brillo al pasar el mouse */
        .stat-card:hover {
            transform: translateY(-8px);
            background: rgba(255, 255, 255, 0.12);
            border-color: #74ebd5;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }

        .stat-card::after {
            content: 'Ver detalles →';
            position: absolute;
            bottom: 10px;
            right: 20px;
            font-size: 10px;
            color: #74ebd5;
            opacity: 0;
            transition: 0.3s;
        }

        .stat-card:hover::after { opacity: 1; }

        .stat-icon {
            width: 55px; height: 55px;
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 22px;
        }

        .stat-info h3 { font-size: 12px; color: rgba(255,255,255,0.5); text-transform: uppercase; }
        .stat-info .number { font-size: 28px; font-weight: 700; color: #fff; }

        /* Colores */
        .icon-libros { background: rgba(116, 235, 213, 0.2); color: #74ebd5; }
        .icon-usuarios { background: rgba(159, 172, 230, 0.2); color: #9face6; }
        .icon-activos { background: rgba(245, 166, 35, 0.2); color: #f5a623; }
        .icon-atrasados { background: rgba(255, 75, 75, 0.2); color: #ff4b4b; }
    </style>
</head>
<body>
    <div class="bg-fixed"></div>
    <div class="overlay-master">
        <nav class="navbar">
            <a href="#" class="nav-brand" style="color: #74ebd5; text-decoration: none; font-weight: 700; font-size: 1.4rem;">BIBLIOTECA UNTEC</a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/logout" style="color: #ff4b4b; text-decoration: none;"><i class="fas fa-power-off"></i> Salir</a>
            </div>
        </nav>

        <div class="container">
            <header style="margin-bottom: 40px; color: white;">
                <h1>Bienvenido, <c:out value="${usuarioLogueado.nombre}" default="Administrador" /></h1>
                <p style="opacity: 0.6;">Selecciona una categoría para gestionar la biblioteca</p>
            </header>

            <div class="stats-grid">
                <a href="${pageContext.request.contextPath}/admin/libros" class="stat-link">
                    <div class="stat-card">
                        <div class="stat-icon icon-libros"><i class="fas fa-book"></i></div>
                        <div class="stat-info">
                            <h3>Total Libros</h3>
                            <div class="number"><c:out value="${totalLibros}" default="0" /></div>
                        </div>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/admin/usuarios" class="stat-link">
                    <div class="stat-card">
                        <div class="stat-icon icon-usuarios"><i class="fas fa-users"></i></div>
                        <div class="stat-info">
                            <h3>Comunidad</h3>
                            <div class="number"><c:out value="${totalUsuarios}" default="0" /></div>
                        </div>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/admin/historial" class="stat-link">
                    <div class="stat-card">
                        <div class="stat-icon icon-activos"><i class="fas fa-clock"></i></div>
                        <div class="stat-info">
                            <h3>Préstamos Activos</h3>
                            <div class="number"><c:out value="${totalActivos}" default="0" /></div>
                        </div>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/admin/historial" class="stat-link">
                    <div class="stat-card">
                        <div class="stat-icon icon-atrasados"><i class="fas fa-exclamation-triangle"></i></div>
                        <div class="stat-info">
                            <h3>Atrasados</h3>
                            <div class="number"><c:out value="${totalAtrasados}" default="0" /></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>
</html>