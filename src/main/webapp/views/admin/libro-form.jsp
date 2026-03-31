<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${not empty libro}">Editar Libro</c:when>
            <c:otherwise>Nuevo Libro</c:otherwise>
        </c:choose>
        - UNTEC
    </title>
    
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

        .container { 
            width: 100%;
            max-width: 700px; 
            margin: 50px auto;
            padding: 0 20px;
        }

        /* Estilo específico para el Formulario de Cristal */
        .glass-form-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.5);
            color: white;
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
            color: #74ebd5;
        }

        .form-group { margin-bottom: 20px; }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.7);
            letter-spacing: 0.5px;
        }

        input, select {
            width: 100%;
            padding: 12px 16px;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            color: white;
            font-size: 16px;
            outline: none;
            transition: 0.3s;
        }

        input:focus, select:focus {
            background: rgba(255, 255, 255, 0.12);
            border-color: #74ebd5;
            box-shadow: 0 0 15px rgba(116, 235, 213, 0.2);
        }

        select option {
            background: #1a1a1a; /* Fondo para que las opciones sean legibles */
            color: white;
        }

        .form-check {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 10px;
            cursor: pointer;
        }

        .form-check input {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .buttons-row {
            display: flex;
            gap: 15px;
            margin-top: 35px;
        }

        .btn-submit {
            flex: 2;
            background: #74ebd5;
            color: #1a1a1a;
            font-weight: 700;
            border: none;
            padding: 14px;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.3s;
            font-size: 16px;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(116, 235, 213, 0.4);
            filter: brightness(1.1);
        }

        .btn-cancel {
            flex: 1;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-decoration: none;
            text-align: center;
            padding: 14px;
            border-radius: 12px;
            font-size: 16px;
            transition: 0.3s;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-cancel:hover { background: rgba(255, 75, 75, 0.2); border-color: #ff4b4b; }
    </style>
</head>
<body>
    <div class="bg-fixed"></div>

    <div class="overlay-master">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-brand">📚 UNTEC ADMIN</a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/admin/dashboard" style="color: white; text-decoration: none; font-size: 14px;">Cerrar sesión</a>
            </div>
        </nav>

        <div class="container">
            <div class="glass-form-card">
                <div class="form-title">
                    <c:choose>
                        <c:when test="${not empty libro}">
                            <i class="fas fa-edit"></i> Editar Libro
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-plus-circle"></i> Registrar Nuevo Libro
                        </c:otherwise>
                    </c:choose>
                </div>

                <form action="<%=request.getContextPath()%>/admin/libros" method="post">
                    <input type="hidden" name="idLibro" value="${libro.idLibro}" />

                    <div class="form-group">
                        <label>Código ISBN</label>
                        <input type="text" name="isbn" value="${libro.isbn}" placeholder="Ej: 978-3-16-148410-0" required />
                    </div>

                    <div class="form-group">
                        <label>Título de la Obra</label>
                        <input type="text" name="titulo" value="${libro.titulo}" placeholder="Nombre del libro" required />
                    </div>

                    <div class="form-group">
                        <label>Autor Principal</label>
                        <input type="text" name="autor" value="${libro.autor}" placeholder="Nombre del autor" required />
                    </div>

                    <div style="display: flex; gap: 20px;">
                        <div class="form-group" style="flex: 1;">
                            <label>Año</label>
                            <input type="number" name="anioPublicacion" value="${libro.anioPublicacion}" min="1900" max="2100" required />
                        </div>
                        <div class="form-group" style="flex: 2;">
                            <label>Editorial</label>
                            <input type="text" name="editorial" value="${libro.editorial}" placeholder="Nombre de editorial" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Área de Conocimiento (Categoría)</label>
                        <select name="categoria">
                            <c:forEach var="cat" items="${['Matematicas','Programacion','Base de Datos','Redes','Ingenieria Software','Sistemas Operativos','Inteligencia Artificial','Fisica','Quimica','Biologia','Administracion','Marketing','Contabilidad','Economia','Filosofia','Historia','Psicologia','Sociologia','Literatura']}">
                                <option value="${cat}" ${libro.categoria == cat ? 'selected' : ''}>${cat}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-check">
                            <input type="checkbox" name="disponible" ${libro.disponible || empty libro ? 'checked' : ''} />
                            <span>Marcar como disponible para préstamos</span>
                        </label>
                    </div>

                    <div class="buttons-row">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-save"></i> 
                            <c:choose>
                                <c:when test="${not empty libro}">Guardar Cambios</c:when>
                                <c:otherwise>Registrar Libro</c:otherwise>
                            </c:choose>
                        </button>
                        <a href="<%=request.getContextPath()%>/admin/libros" class="btn-cancel">
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>