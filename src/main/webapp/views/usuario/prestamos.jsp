<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Préstamos - Biblioteca UNTEC</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body { 
            margin: 0;
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
            position: sticky; top: 0; width: 100%;
            background: rgba(10, 10, 10, 0.6); 
            backdrop-filter: blur(15px) saturate(150%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 50px;
            display: flex; justify-content: space-between; align-items: center;
            z-index: 1000;
        }

        .nav-brand { color: #74ebd5; text-decoration: none; font-weight: 700; font-size: 1.6rem; letter-spacing: 1px; }
        .nav-links { display: flex; align-items: center; gap: 30px; }
        .nav-links a { 
            color: white; 
            text-decoration: none; 
            font-size: 17px; 
            font-weight: 500;
            opacity: 0.85; 
            transition: 0.3s; 
            display: flex; align-items: center; gap: 8px;
        }
        .nav-links a:hover { opacity: 1; color: #74ebd5; }

        .btn-logout { color: #ff5f5f !important; font-size: 24px !important; margin-left: 10px; }
        .btn-logout:hover { transform: scale(1.2); }

        .container { width: 95%; max-width: 1200px; margin: 40px auto; padding: 0 20px; }

        .table-section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 24px;
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { 
            text-align: left; 
            padding: 18px; 
            color: #74ebd5; 
            border-bottom: 2px solid rgba(116, 235, 213, 0.3); 
            font-size: 14px; 
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        td { padding: 18px; border-bottom: 1px solid rgba(255,255,255,0.05); font-size: 15px; }
        tr:hover td { background: rgba(255, 255, 255, 0.03); }

       .badge { 
            padding: 6px 14px; 
            border-radius: 10px; 
            font-size: 11px; 
            font-weight: bold; 
            text-transform: uppercase; 
        }
        .badge-success { background: rgba(116, 235, 213, 0.2); color: #74ebd5; border: 1px solid #74ebd5; }
        .badge-warning { background: rgba(245, 166, 35, 0.2); color: #f5a623; border: 1px solid #f5a623; }
        .badge-danger  { background: rgba(255, 75, 75, 0.2); color: #ff4b4b; border: 1px solid #ff4b4b; }

        
        .btn-action {
            padding: 10px 20px;
            border-radius: 12px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-devolver { 
            background: #f5a623; 
            color: #000; 
            box-shadow: 0 4px 12px rgba(245, 166, 35, 0.3);
        }
        .btn-devolver:hover { transform: translateY(-2px); background: #fff; }

        .btn-catalogo {
            background: #74ebd5;
            color: #000;
            padding: 15px 30px;
            border-radius: 15px;
            font-weight: 700;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        
        .msg-exito {
            background: rgba(116, 235, 213, 0.15);
            color: #74ebd5;
            padding: 20px;
            border-radius: 18px;
            border: 1px solid #74ebd5;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 500;
        }

        .empty-state {
            text-align: center;
            padding: 60px;
            opacity: 0.8;
        }
        .empty-state i { font-size: 50px; color: #74ebd5; margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="overlay-master">
        <nav class="navbar">
            <a href="#" class="nav-brand">BIBLIOTECA UNTEC</a>
            <div class="nav-links">
                <a href="<%=request.getContextPath()%>/usuario/dashboard"><i class="fas fa-home"></i> Inicio</a>
                <a href="<%=request.getContextPath()%>/usuario/catalogo"><i class="fas fa-search"></i> Catálogo</a>
                <a href="<%=request.getContextPath()%>/logout" class="btn-logout" title="Cerrar sesión">
                    <i class="fas fa-power-off"></i>
                </a>
            </div>
        </nav>

        <div class="container">
            <header style="margin-bottom: 40px; text-align: center;">
                <h2 style="font-size: 32px; font-weight: 700;">📋 Mis Préstamos</h2>
                <p style="opacity: 0.7; font-size: 16px;">Gestiona tus libros solicitados y fechas de devolución</p>
            </header>

            <%-- Mensajes de feedback --%>
            <c:if test="${param.exito == 'solicitado'}">
                <div class="msg-exito">
                    <i class="fas fa-check-circle"></i> ¡Préstamo solicitado exitosamente! Disfruta tu lectura.
                </div>
            </c:if>
            <c:if test="${param.exito == 'devuelto'}">
                <div class="msg-exito">
                    <i class="fas fa-undo-alt"></i> Libro devuelto correctamente. El sistema ha sido actualizado.
                </div>
            </c:if>

            <div class="table-section">
                <c:choose>
                    <c:when test="${empty prestamos}">
                        <div class="empty-state">
                            <i class="fas fa-folder-open"></i>
                            <h3>No tienes historial de préstamos</h3>
                            <p>¿Buscas algo nuevo para leer?</p>
                            <a href="<%=request.getContextPath()%>/usuario/catalogo" class="btn-catalogo">
                                <i class="fas fa-book"></i> Explorar Catálogo
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>Libro</th>
                                    <th>Fecha Préstamo</th>
                                    <th>Fecha Límite</th>
                                    <th>Devolución</th>
                                    <th>Estado</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${prestamos}">
                                    <tr>
                                        <td style="font-weight: 600;">${p.tituloLibro}</td>
                                        <td>${p.fechaPrestamo}</td>
                                        <td style="color: #f5a623;">${p.fechaLimite}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${empty p.fechaDevolucion}">
                                                    <span style="opacity: 0.4;">Pendiente</span>
                                                </c:when>
                                                <c:otherwise>${p.fechaDevolucion}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.estado == 'ACTIVO'}">
                                                    <span class="badge badge-warning">Activo</span>
                                                </c:when>
                                                <c:when test="${p.estado == 'DEVUELTO'}">
                                                    <span class="badge badge-success">Devuelto</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-danger">Atrasado</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${p.estado != 'DEVUELTO'}">
                                                    <a href="${pageContext.request.contextPath}/usuario/prestamos?accion=devolver&id=${p.idPrestamo}" 
                                                       class="btn-action btn-devolver" 
                                                       onclick="return confirm('¿Confirmas la devolución de: ${p.tituloLibro}?')">
                                                       <i class="fas fa-exchange-alt"></i> Devolver
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="font-size: 12px; opacity: 0.5; font-style: italic;">Finalizado</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
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