<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil - Biblioteca UNTEC</title>
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

        .container { 
            width: 90%; 
            max-width: 650px; 
            margin: 40px auto; 
            padding: 0 20px; 
        }

        .card-perfil {
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 30px;
            padding: 45px;
            backdrop-filter: blur(15px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.3);
        }

        h2 { margin-bottom: 30px; font-size: 28px; font-weight: 700; text-align: center; color: #74ebd5; }

        
        .form-group { margin-bottom: 22px; }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        label i { color: #74ebd5; font-size: 16px; width: 20px; text-align: center; }

        input, select {
            width: 100%;
            padding: 14px 18px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            font-size: 15px;
            color: white;
            transition: 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #74ebd5;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 15px rgba(116, 235, 213, 0.2);
        }

        input:disabled {
            background: rgba(0, 0, 0, 0.2);
            color: rgba(255, 255, 255, 0.4);
            border-color: rgba(255, 255, 255, 0.05);
            cursor: not-allowed;
        }

        select option { background: #1a1a1a; color: white; }

        .btn-save {
            width: 100%;
            padding: 16px;
            background: #74ebd5;
            color: #000;
            border: none;
            border-radius: 16px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
            box-shadow: 0 8px 20px rgba(116, 235, 213, 0.25);
        }
        .btn-save:hover { background: #fff; transform: translateY(-3px); }

        
        .msg { padding: 15px; border-radius: 15px; margin-bottom: 25px; text-align: center; font-size: 14px; }
        .error { background: rgba(255, 75, 75, 0.15); color: #ff4b4b; border: 1px solid #ff4b4b; }
        .exito { background: rgba(116, 235, 213, 0.15); color: #74ebd5; border: 1px solid #74ebd5; }

        .hint { font-size: 11px; color: rgba(255,255,255,0.4); margin-top: 8px; font-style: italic; }
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
            <div class="card-perfil">
                <h2><i class="fas fa-user-circle"></i> Mi Perfil Académico</h2>

                <c:if test="${not empty error}">
                    <div class="msg error"><i class="fas fa-exclamation-circle"></i> ${error}</div>
                </c:if>
                <c:if test="${not empty exito}">
                    <div class="msg exito"><i class="fas fa-check-circle"></i> ${exito}</div>
                </c:if>

                <form action="<%=request.getContextPath()%>/usuario/perfil" method="post">

                    <div class="form-group">
                        <label><i class="fas fa-id-card"></i> RUT</label>
                        <input type="text" value="${sessionScope.usuarioLogueado.rut}" disabled />
                        <p class="hint">El RUT es un identificador único y no puede modificarse.</p>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-user"></i> Nombre completo</label>
                        <input type="text" name="nombre" value="${sessionScope.usuarioLogueado.nombre}" required />
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-envelope"></i> Correo Institucional</label>
                        <input type="email" name="email" value="${sessionScope.usuarioLogueado.email}" required />
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-graduation-cap"></i> Carrera</label>
                        <select name="carrera">
                            <c:set var="c" value="${sessionScope.usuarioLogueado.carrera}" />
                            <option value="Ingeniería Informática" ${c == 'Ingeniería Informática' ? 'selected' : ''}>Ingeniería Informática</option>
                            <option value="Ingeniería Civil" ${c == 'Ingeniería Civil' ? 'selected' : ''}>Ingeniería Civil</option>
                            <option value="Administración" ${c == 'Administración' ? 'selected' : ''}>Administración</option>
                            <option value="Contabilidad" ${c == 'Contabilidad' ? 'selected' : ''}>Contabilidad</option>
                            <option value="Psicología" ${c == 'Psicología' ? 'selected' : ''}>Psicología</option>
                            <option value="Derecho" ${c == 'Derecho' ? 'selected' : ''}>Derecho</option>
                            <option value="Medicina" ${c == 'Medicina' ? 'selected' : ''}>Medicina</option>
                            <option value="Marketing" ${c == 'Marketing' ? 'selected' : ''}>Marketing</option>
                            <option value="Otra" ${c == 'Otra' ? 'selected' : ''}>Otra</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label><i class="fas fa-key"></i> Nueva Contraseña</label>
                        <input type="password" name="password" placeholder="••••••••" />
                        <p class="hint">Dejar en blanco para mantener la actual. Use una combinación segura.</p>
                    </div>

                    <button type="submit" class="btn-save">
                        <i class="fas fa-save"></i> Guardar Cambios
                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>