<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Biblioteca UNTEC</title>
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: 'Poppins', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; /* Poppins da un toque moderno */
            margin: 0;
            overflow: hidden; 
        }

        
        .bg-image {
            background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000'); /* Imagen de libros alta calidad */
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        
        .login-container {
            background: rgba(255, 255, 255, 0.15); 
            
            backdrop-filter: blur(15px); 
            -webkit-backdrop-filter: blur(15px); 
            
            border: 1px solid rgba(255, 255, 255, 0.2);
            
            padding: 50px 40px;
            border-radius: 20px; 
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2); /* Sombra suave y difusa */
            
            width: 90%;
            max-width: 420px;
            position: relative;
            z-index: 10; 
            text-align: center;
        }

        
        h2 {
            margin-bottom: 30px;
            color: white; 
            font-size: 2rem;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2); 
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left; 
        }

        
        label {
            display: block;
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.9);
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        
        input {
            width: 100%;
            padding: 14px;
            background: rgba(0, 0, 0, 0.2); 
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            font-size: 15px;
            color: white; 
            transition: all 0.3s ease;
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.5); 
        }

        input:focus {
            outline: none;
            background: rgba(0, 0, 0, 0.3);
            border-color: #74ebd5; 
            box-shadow: 0 0 10px rgba(116, 235, 213, 0.3);
        }

        button {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #74ebd5, #9face6); 
            color: #333; 
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(116, 235, 213, 0.4);
        }

        button:hover {
            background: linear-gradient(45deg, #9face6, #74ebd5);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(116, 235, 213, 0.6);
        }

        
        .error {
            background-color: rgba(255, 75, 75, 0.2);
            color: #ffcccc;
            padding: 14px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px solid rgba(255, 75, 75, 0.4);
            backdrop-filter: blur(5px);
        }

        .exito {
            background-color: rgba(40, 167, 69, 0.2);
            color: #c3e6cb;
            padding: 14px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px solid rgba(40, 167, 69, 0.4);
            backdrop-filter: blur(5px);
        }

        .register-link {
            margin-top: 30px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.7);
        }

        .register-link a {
            color: #74ebd5; 
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: white;
            text-decoration: underline;
        }

        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translate3d(0, -20px, 0);
            }
            to {
                opacity: 1;
                transform: translate3d(0, 0, 0);
            }
        }
        
        .login-container {
            animation: fadeInDown 0.8s ease-out;
        }

    </style>
</head>

<body>
    <div class="bg-image">
        <div class="login-container">
            <h2>Bienvenido a la Biblioteca UNTEC</h2>

            <%-- Mostrar error si existe --%>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <%-- Mostrar éxito si viene de registro --%>
            <c:if test="${param.registro == 'exitoso'}">
                <div class="exito">✅ Registro exitoso, ya puedes iniciar sesión</div>
            </c:if>

            <form action="<%=request.getContextPath()%>/login" method="post">
                <div class="form-group">
                    <label for="email">Tu correo electrónico</label>
                    <input type="email" id="email" name="email" placeholder="ejemplo@untec.cl" required />
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required />
                </div>
                <button type="submit">Ingresar</button>
            </form>

            <div class="register-link">
                ¿Aún no tienes cuenta? <a href="<%=request.getContextPath()%>/registro">Crea una aquí</a>
            </div>
        </div>
    </div>
</body>

</html>