package com.untec.biblioteca.servlet;

import com.untec.biblioteca.dao.UsuarioDAO;
import com.untec.biblioteca.model.Usuario;

import com.untec.biblioteca.util.ConexionDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		
		if (email != null)
			email = email.toLowerCase();

		try {
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			Usuario usuario = usuarioDAO.buscarPorEmail(email);

			
			if (usuario != null && password != null && password.equals(usuario.getPassword())) {

				if (!usuario.isActivo()) {
					request.setAttribute("error", "Tu cuenta ha sido bloqueada.");
					request.getRequestDispatcher("/views/login.jsp").forward(request, response);
					return;
				}

				HttpSession session = request.getSession();
				session.setAttribute("usuarioLogueado", usuario);

				
				if ("ADMIN".equalsIgnoreCase(usuario.getRol())) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				} else {
					response.sendRedirect(request.getContextPath() + "/usuario/dashboard");
				}

			} else {
				request.setAttribute("error", "Email o contraseña incorrectos");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error en base de datos biblioteca_untec1", e);
		}
	}
}