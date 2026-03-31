<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Biblioteca UNTEC</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        
        body { 
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
            overflow-x: hidden;
            color: white;
        }

        
        .overlay-master {
            width: 100%;
            min-height: 100vh;
            background: rgba(0, 0, 0, 0.45); 
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            display: flex;
            flex-direction: column;
        }

        
        .navbar {
            position: sticky;
            top: 0;
            width: 100%;
            background: rgba(10, 10, 10, 0.4); 
            backdrop-filter: blur(10px) saturate(130%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
        }

        .container { 
            width: 100%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 30px;
        }

        .accesos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 50px;
        }

        .acceso {
            text-decoration: none;
            color: inherit;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 24px;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            backdrop-filter: blur(10px);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .acceso:hover {
            transform: translateY(-12px);
            background: rgba(255, 255, 255, 0.15);
            border-color: #74ebd5;
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
        }

        .acceso i {
            width: 90px;
            height: 90px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            background: rgba(116, 235, 213, 0.15); 
            color: #74ebd5;
            margin-bottom: 20px;
        }

        .info-txt strong { font-size: 20px; display: block; margin-bottom: 5px; }
        .info-txt p { font-size: 13px; opacity: 0.6; text-transform: uppercase; }

        .table-section {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; padding: 15px; color: #74ebd5; border-bottom: 1px solid rgba(255,255,255,0.1); font-size: 13px; }
        td { padding: 15px; border-bottom: 1px solid rgba(255,255,255,0.05); font-size: 14px; }

        .badge { padding: 5px 12px; border-radius: 8px; font-size: 11px; font-weight: bold; }
        .badge-warning { background: rgba(245, 166, 35, 0.2); color: #f5a623; border: 1px solid #f5a623; }
        .badge-danger  { background: rgba(255, 75, 75, 0.2); color: #ff4b4b; border: 1px solid #ff4b4b; }
    </style>
</head>
<body>
    <div class="overlay-master">
        <nav class="navbar">
            <a href="#" class="nav-brand" style="color: #74ebd5; text-decoration: none; font-weight: 700; font-size: 1.4rem;">BIBLIOTECA UNTEC</a>
            <div class="nav-links">
                <a href="<%=request.getContextPath()%>/logout" style="color: #ff4b4b; text-decoration: none;"><i class="fas fa-power-off"></i> Salir</a>
            </div>
        </nav>

        <div class="container">
            <header style="margin-bottom: 30px; text-align: center;">
                <p style="opacity: 0.8; text-transform: uppercase; color: #74ebd5; font-size: 12px; letter-spacing: 1px;">${sessionScope.usuarioLogueado.carrera}</p>
                <h1 style="font-size: 30px; font-weight: 700;">Hola, ${sessionScope.usuarioLogueado.nombre}</h1>
            </header>

            <div class="accesos">
                <a href="<%=request.getContextPath()%>/usuario/catalogo" class="acceso">
                    <i class="fas fa-search"></i>
                    <div class="info-txt">
                        <strong>Explorar Catálogo</strong>
                        <p>Buscar libros</p>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/usuario/prestamos" class="acceso">
                    <i class="fas fa-book"></i>
                    <div class="info-txt">
                        <strong>Mis Préstamos</strong>
                        <p>Libros activos</p>
                    </div>
                </a>
                <a href="<%=request.getContextPath()%>/usuario/perfil" class="acceso">
                    <i class="fas fa-user-circle"></i>
                    <div class="info-txt">
                        <strong>Mi Perfil</strong>
                        <p>Mis datos</p>
                    </div>
                </a>
            </div>

            <div class="table-section">
                <h3 style="margin-bottom: 20px; font-weight: 400;">📖 Mis Préstamos Activos</h3>
                <c:choose>
                    <c:when test="${empty prestamos}">
                        <p style="text-align: center; opacity: 0.5; padding: 20px;">No tienes préstamos activos.</p>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>Libro</th>
                                    <th>Fecha Préstamo</th>
                                    <th>Fecha Límite</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="prestamo" items="${prestamos}">
                                    <c:if test="${prestamo.estado == 'ACTIVO' || prestamo.estado == 'ATRASADO'}">
                                        <tr>
                                            <td style="font-weight: 600;">${prestamo.tituloLibro}</td>
                                            <td>${prestamo.fechaPrestamo}</td>
                                            <td>${prestamo.fechaLimite}</td>
                                            <td>
                                                <span class="badge ${prestamo.estado == 'ACTIVO' ? 'badge-warning' : 'badge-danger'}">
                                                    ${prestamo.estado}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>