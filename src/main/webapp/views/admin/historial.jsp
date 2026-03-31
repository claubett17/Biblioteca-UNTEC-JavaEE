<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Préstamos - UNTEC</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        
        html, body {
            min-height: 100%;
            font-family: 'Poppins', sans-serif;
            background-color: #000;
            background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            background-attachment: fixed;
            overflow-x: hidden;
        }

        .overlay-master {
            position: relative;
            z-index: 1;
            min-height: 100vh;
            background: rgba(0, 0, 0, 0.75); 
            display: flex;
            flex-direction: column;
        }

        .navbar {
            position: sticky;
            top: 0;
            width: 100%;
            background: rgba(20, 20, 20, 0.6); 
            backdrop-filter: blur(25px) saturate(150%);
            -webkit-backdrop-filter: blur(25px) saturate(150%);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
        }

        .nav-brand { color: #74ebd5; text-decoration: none; font-weight: 700; font-size: 1.4rem; }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 14px;
            opacity: 0.8;
            transition: 0.3s;
        }

        .nav-links a:hover { opacity: 1; color: #74ebd5; }

        .container { 
            width: 95%; 
            max-width: 1300px; 
            margin: 30px auto; 
            padding-bottom: 50px;
        }

        .header { margin-bottom: 25px; color: white; }

        #buscador {
            width: 100%;
            padding: 15px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            color: white;
            margin-bottom: 20px;
            outline: none;
            backdrop-filter: blur(10px);
        }

        
        .btn-recibir {
            color: #74ebd5;
            text-decoration: none;
            border: 1px solid #74ebd5;
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 500;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap; 
        }

        .btn-recibir:hover {
            background: #74ebd5;
            color: #000;
        }

        .table-custom {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

        .table-custom th, .table-custom td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>
    <div class="overlay-master">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-brand">UNTEC ADMINISTRADOR</a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> Inicio</a>
                <a href="${pageContext.request.contextPath}/admin/libros"><i class="fas fa-book"></i> Libros</a>
                <a href="${pageContext.request.contextPath}/admin/historial"><i class="fas fa-history"></i> Historial</a>
                <a href="${pageContext.request.contextPath}/logout" style="color: #ff4b4b;"><i class="fas fa-sign-out-alt"></i> Salir</a>
            </div>
        </nav>

        <div class="container">
            <div class="header">
                <h2>Historial de Préstamos</h2>
                <p style="color: rgba(255,255,255,0.6); margin-top: 5px;">Seguimiento de entregas y devoluciones</p>
            </div>

            <input type="text" id="buscador" placeholder="🔍 Buscar por usuario o libro..." onkeyup="filtrar()" />

            <div class="content-card">
                <table id="tablaPrestamos" class="table-custom">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Usuario</th>
                            <th>Libro</th>
                            <th>Préstamo</th>
                            <th>Límite</th>
                            <th>Estado</th>
                            <th style="text-align: right;">Gestión</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${prestamos}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td><strong>${p.nombreUsuario}</strong></td>
                                <td><i class="fas fa-book-reader" style="color:#74ebd5; margin-right:8px;"></i>${p.tituloLibro}</td>
                                <td style="opacity: 0.8;">${p.fechaPrestamo}</td>
                                <td style="color: #9face6;">${p.fechaLimite}</td>
                                <td>
                                    <span class="badge ${p.estado == 'ACTIVO' ? 'badge-activo' : (p.estado == 'DEVUELTO' ? 'badge-devuelto' : 'badge-atrasado')}">
                                        ${p.estado}
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <c:if test="${p.estado != 'DEVUELTO'}">
                                        <a href="${pageContext.request.contextPath}/admin/historial?accion=devolver&id=${p.idPrestamo}"
                                           class="btn-recibir"
                                           onclick="return confirm('¿Confirmar devolución de: ${p.tituloLibro}?')">
                                            <i class="fas fa-undo-alt"></i> Recibir Libro
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function filtrar() {
            let busqueda = document.getElementById("buscador").value.toLowerCase();
            let filas = document.querySelectorAll("#tablaPrestamos tbody tr");
            filas.forEach(f => f.style.display = f.innerText.toLowerCase().includes(busqueda) ? "" : "none");
        }
    </script>
</body>
</html>