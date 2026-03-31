<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Libros - UNTEC</title>
    
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

        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; color: white; }

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

        
        .btn-nuevo-libro {
            background-color: transparent;
            border: 1px solid #74ebd5;
            color: #74ebd5;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-nuevo-libro:hover {
            background-color: #74ebd5;
            color: #000;
        }

        .btn-accion-edit {
            color: #74ebd5;
            font-size: 1.2rem;
            text-decoration: none;
            transition: 0.2s;
        }

        .btn-accion-edit:hover {
            color: white;
            transform: scale(1.1);
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
                <h2>Gestión de Inventario</h2>
                <a href="${pageContext.request.contextPath}/admin/libros?accion=nuevo" class="btn-nuevo-libro">
                    <i class="fas fa-plus"></i> Nuevo Libro
                </a>
            </div>

            <input type="text" id="buscador" placeholder="🔍 Filtrar por título, autor o ISBN..." onkeyup="filtrarLibros()">

            <div class="content-card">
                <table id="tablaLibros" class="table-custom">
                    <thead>
                        <tr>
                            <th>ISBN</th>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Estado</th>
                            <th style="text-align: right;">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="libro" items="${libros}">
                            <tr>
                                <td><code style="background: rgba(255,255,255,0.1); padding: 2px 6px; border-radius: 4px;">${libro.isbn}</code></td>
                                <td><strong>${libro.titulo}</strong></td>
                                <td>${libro.autor}</td>
                                <td>
                                    <span class="badge ${libro.disponible ? 'badge-activo' : 'badge-atrasado'}">
                                        ${libro.disponible ? 'Disponible' : 'En Préstamo'}
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <a href="${pageContext.request.contextPath}/admin/libros?accion=editar&id=${libro.idLibro}" class="btn-accion-edit">
                                        <i class="fas fa-edit"></i>
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
        function filtrarLibros() {
            let busqueda = document.getElementById("buscador").value.toLowerCase();
            let filas = document.querySelectorAll("#tablaLibros tbody tr");
            filas.forEach(f => f.style.display = f.innerText.toLowerCase().includes(busqueda) ? "" : "none");
        }
    </script>
</body>
</html>