<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios - UNTEC</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        html, body {
            height: 100%;
            font-family: 'Poppins', sans-serif;
            background: #000;
            overflow-x: hidden;
        }

        .bg-fixed {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000') no-repeat center center;
            background-size: cover;
            z-index: 0;
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

        #buscador:focus { border-color: #74ebd5; background: rgba(255, 255, 255, 0.12); }

        .acciones { display: flex; gap: 8px; justify-content: flex-end; }
    </style>
</head>
<body>
    <div class="bg-fixed"></div>

    <div class="overlay-master">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-brand">
                UNTEC ADMININSTRADOR
            </a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-home"></i> Inicio</a>
                <a href="${pageContext.request.contextPath}/admin/libros"><i class="fas fa-book"></i> Libros</a>
                <a href="${pageContext.request.contextPath}/admin/historial"><i class="fas fa-history"></i> Historial</a>
                <a href="${pageContext.request.contextPath}/logout" style="color: #ff4b4b;"><i class="fas fa-sign-out-alt"></i> Salir</a>
            </div>
        </nav>

        <div class="container">
            <div class="header">
                <h2>👤 Comunidad de Lectores</h2>
                <p style="color: rgba(255,255,255,0.6); margin-top: 5px;">Administración de alumnos y equipo bibliotecario</p>
            </div>

            <input type="text" id="buscador" placeholder="🔍 Buscar por nombre, carrera o email..." onkeyup="filtrar()" />

            <div class="content-card">
                <table id="tablaUsuarios" class="table-custom">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Lector</th>
                            <th>RUT / ID</th>
                            <th>Carrera</th>
                            <th>Estado</th>
                            <th style="text-align: right;">Gestión</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${usuarios}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td>
                                    <div style="font-weight: 600;">${u.nombre}</div>
                                    <small style="opacity: 0.6;">${u.email}</small>
                                </td>
                                <td><code style="background: rgba(255,255,255,0.1); padding: 2px 6px; border-radius: 4px;">${u.rut}</code></td>
                                <td><span style="color: #9face6;">${u.carrera}</span></td>
                                <td>
                                    <span class="badge ${u.activo ? 'badge-activo' : 'badge-atrasado'}" style="min-width: 115px;">
                                        <i class="fas ${u.activo ? 'fa-check-circle' : 'fa-hourglass-half'}"></i>
                                        ${u.activo ? 'Habilitado' : 'En Pausa'}
                                    </span>
                                </td>
                                <td class="acciones">
                                    <c:choose>
                                        <c:when test="${u.activo}">
                                            <a href="<%=request.getContextPath()%>/admin/usuarios?accion=bloquear&id=${u.idUsuario}"
                                               class="btn-action"
                                               style="background: rgba(245, 166, 35, 0.15); color: #f5a623; border: 1px solid #f5a623;"
                                               title="Poner en pausa"
                                               onclick="return confirm('¿Poner en pausa temporal la cuenta de ${u.nombre}?')">
                                                <i class="fas fa-user-clock"></i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<%=request.getContextPath()%>/admin/usuarios?accion=desbloquear&id=${u.idUsuario}"
                                               class="btn-action btn-edit"
                                               title="Habilitar para préstamos"
                                               onclick="return confirm('¿Habilitar nuevamente a ${u.nombre}?')">
                                                <i class="fas fa-user-check"></i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    <a href="<%=request.getContextPath()%>/admin/usuarios?accion=eliminar&id=${u.idUsuario}"
                                       class="btn-action"
                                       style="background: rgba(255, 75, 75, 0.15); color: #ff4b4b; border: 1px solid #ff4b4b;"
                                       onclick="return confirm('¿Eliminar registro de ${u.nombre}?')">
                                        <i class="fas fa-user-minus"></i>
                                    </a>
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
            let filas = document.querySelectorAll("#tablaUsuarios tbody tr");
            filas.forEach(fila => {
                fila.style.display = fila.innerText.toLowerCase().includes(busqueda) ? "" : "none";
            });
        }
    </script>
</body>
</html>