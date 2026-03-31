<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Biblioteca UNTEC</title>
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            margin: 0;
        }

        .bg-image {
            background-image: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        
        .register-container {
            background: rgba(255, 255, 255, 0.12); 
            backdrop-filter: blur(18px); 
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            width: 90%;
            max-width: 500px; 
            z-index: 10;
            animation: fadeInUp 0.6s ease-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: white;
            font-size: 1.8rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-group {
            flex: 1;
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.9);
            font-size: 13px;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 12px;
            background: rgba(0, 0, 0, 0.25); 
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            font-size: 14px;
            color: white;
            transition: all 0.3s;
        }

        
        select option {
            background: #222;
            color: white;
        }

        input:focus {
            outline: none;
            background: rgba(0, 0, 0, 0.4);
            border-color: #74ebd5;
            box-shadow: 0 0 12px rgba(116, 235, 213, 0.3);
        }

        
        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, #74ebd5, #9face6);
            color: #222;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 20px;
            transition: all 0.3s;
            text-transform: uppercase;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(116, 235, 213, 0.5);
            filter: brightness(1.1);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: rgba(255, 255, 255, 0.7);
        }

        .login-link a {
            color: #74ebd5;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            color: white;
            text-decoration: underline;
        }

        
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="bg-image">
        <div class="register-container">
            <h2>📝 Crear Cuenta UNTEC</h2>

            <form action="<%=request.getContextPath()%>/registro" method="post">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="nombre">Nombre Completo</label>
                        <input type="text" id="nombre" name="nombre" placeholder="Juan Pérez" required />
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Correo Institucional</label>
                    <input type="email" id="email" name="email" placeholder="ejemplo@untec.cl" required />
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" id="password" name="password" placeholder="••••••••" required />
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirmar</label>
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="••••••••" required />
                    </div>
                </div>

                <button type="submit">Finalizar Registro</button>
            </form>

            <div class="login-link">
                ¿Ya tienes cuenta? <a href="<%=request.getContextPath()%>/login">Inicia sesión aquí</a>
            </div>
        </div>
    </div>
</body>

</html>