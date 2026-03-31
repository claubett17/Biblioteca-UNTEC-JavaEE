<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Catálogo - Biblioteca UNTEC</title>
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
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .nav-links a:hover { opacity: 1; color: #74ebd5; }

        /* Icono de cerrar sesión específico */
        .btn-logout { 
            color: #ff5f5f !important; 
            font-size: 22px !important; 
            margin-left: 10px;
        }
        .btn-logout:hover { transform: scale(1.2); }

        .container { width: 95%; max-width: 1200px; margin: 40px auto; padding: 0 20px; }

        
        .search-container { margin-bottom: 40px; position: relative; }
        #buscador {
            width: 100%;
            padding: 18px 25px 18px 60px;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            color: white;
            font-size: 16px;
            backdrop-filter: blur(10px);
            transition: 0.3s;
        }
        #buscador:focus { outline: none; border-color: #74ebd5; box-shadow: 0 0 20px rgba(116, 235, 213, 0.2); }
        .search-icon { position: absolute; left: 25px; top: 50%; transform: translateY(-50%); color: #74ebd5; font-size: 20px; }

        
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 30px; }
        .card {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            padding: 30px;
            display: flex; flex-direction: column;
            backdrop-filter: blur(5px);
            transition: 0.4s ease;
        }
        .card:hover { transform: translateY(-10px); background: rgba(255, 255, 255, 0.1); border-color: #74ebd5; }
        .card h3 { font-size: 20px; margin-bottom: 15px; color: #fff; line-height: 1.3; }
        .card p { font-size: 14px; color: rgba(255,255,255,0.6); margin-bottom: 8px; }
        .card p i { color: #74ebd5; margin-right: 10px; width: 20px; text-align: center; }

        
        .badge { align-self: flex-start; padding: 6px 14px; border-radius: 10px; font-size: 11px; font-weight: bold; margin: 15px 0 25px 0; text-transform: uppercase; letter-spacing: 1px; }
        .badge-success { background: rgba(116, 235, 213, 0.2); color: #74ebd5; border: 1px solid #74ebd5; }
        .badge-danger { background: rgba(255, 75, 75, 0.2); color: #ff4b4b; border: 1px solid #ff4b4b; }

        .btn { display: block; width: 100%; padding: 14px; border-radius: 15px; text-align: center; text-decoration: none; font-size: 15px; font-weight: 600; transition: 0.3s; margin-top: auto; }
        .btn-primary { background: #74ebd5; color: #000; box-shadow: 0 5px 15px rgba(116, 235, 213, 0.3); }
        .btn-primary:hover { background: #fff; transform: translateY(-2px); }
        .btn-disabled { background: rgba(255,255,255,0.05); color: rgba(255,255,255,0.2); border: 1px solid rgba(255,255,255,0.1); cursor: not-allowed; }

        .msg { padding: 15px; border-radius: 15px; margin-bottom: 30px; text-align: center; }
        .error { background: rgba(255, 75, 75, 0.2); color: #ff4b4b; border: 1px solid #ff4b4b; }
        .exito { background: rgba(116, 235, 213, 0.2); color: #74ebd5; border: 1px solid #74ebd5; }
    </style>
</head>
<body>
    <div class="overlay-master">
        <nav class="navbar">
            <a href="#" class="nav-brand">BIBLIOTECA UNTEC</a>
            <div class="nav-links">
                <a href="<%=request.getContextPath()%>/usuario/dashboard"><i class="fas fa-home"></i> Inicio</a>
                <a href="<%=request.getContextPath()%>/usuario/prestamos"><i class="fas fa-book-reader"></i> Mis Préstamos</a>
                <a href="<%=request.getContextPath()%>/logout" class="btn-logout" title="Cerrar sesión">
                    <i class="fas fa-power-off"></i>
                </a>
            </div>
        </nav>

        <div class="container">
            <header style="margin-bottom: 40px; text-align: center;">
                <h2 style="font-size: 32px; font-weight: 700; letter-spacing: -0.5px;">📖 Catálogo de Libros</h2>
                <p style="opacity: 0.7; font-size: 16px;">Encuentra el material que necesitas para tus proyectos</p>
            </header>

            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="buscador" placeholder="Busca por título, autor o categoría..." onkeyup="filtrarLibros()"/>
            </div>

            <c:if test="${not empty error}">
                <div class="msg error"><i class="fas fa-exclamation-triangle"></i> ${error}</div>
            </c:if>
            <c:if test="${param.exito == 'solicitado'}">
                <div class="msg exito"><i class="fas fa-check-circle"></i> ¡Préstamo solicitado con éxito!</div>
            </c:if>

            <div class="grid">
                <c:forEach var="libro" items="${libros}">
                    <div class="card">
                        <h3>${libro.titulo}</h3>
                        <p><i class="fas fa-user-edit"></i> ${libro.autor}</p>
                        <p><i class="fas fa-university"></i> ${libro.editorial}</p>
                        <p><i class="fas fa-clock"></i> Año: ${libro.anioPublicacion}</p>
                        <p><i class="fas fa-bookmark"></i> ${libro.categoria}</p>
                        
                        <c:choose>
                            <c:when test="${libro.disponible}">
                                <span class="badge badge-success">Disponible</span>
                                <a href="<%=request.getContextPath()%>/usuario/prestamos?accion=solicitar&id=${libro.idLibro}"
                                   class="btn btn-primary"
                                   onclick="return confirm('¿Deseas solicitar el préstamo de este libro?')">
                                    Solicitar ahora
                                </a>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-danger">Agotado</span>
                                <span class="btn btn-disabled">No disponible</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        function filtrarLibros() {
            let busqueda = document.getElementById("buscador").value.toLowerCase();
            let tarjetas = document.querySelectorAll(".card");

            tarjetas.forEach(function(tarjeta) {
                let texto = tarjeta.innerText.toLowerCase();
                if (texto.includes(busqueda)) {
                    tarjeta.style.display = "flex";
                    tarjeta.style.opacity = "1";
                } else {
                    tarjeta.style.display = "none";
                    tarjeta.style.opacity = "0";
                }
            });
        }
    </script>
</body>
</html>