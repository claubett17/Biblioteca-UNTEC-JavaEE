package com.untec.biblioteca.servlet;

import com.untec.biblioteca.dao.UsuarioDAO;
import com.untec.biblioteca.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/usuarios")
public class UsuarioServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("usuarioLogueado") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
		if (!"ADMIN".equals(usuario.getRol())) {
			response.sendRedirect(request.getContextPath() + "/usuario/dashboard");
			return;
		}

		
		String accion = request.getParameter("accion");
		if (accion == null)
			accion = "listar";

		try {
			UsuarioDAO usuarioDAO = new UsuarioDAO();

			switch (accion) {

			case "listar":
				
				List<Usuario> usuarios = usuarioDAO.listarTodos();
				request.setAttribute("usuarios", usuarios);
				request.getRequestDispatcher("/views/admin/usuarios.jsp").forward(request, response);
				break;
			case "bloquear":
				
				int idBloquear = Integer.parseInt(request.getParameter("id"));
				usuarioDAO.toggleActivo(idBloquear, false);
				response.sendRedirect(request.getContextPath() + "/admin/usuarios");
				break;

			case "desbloquear":
				
				int idDesbloquear = Integer.parseInt(request.getParameter("id"));
				usuarioDAO.toggleActivo(idDesbloquear, true);
				response.sendRedirect(request.getContextPath() + "/admin/usuarios");
				break;

			case "eliminar":
				
				int idEliminar = Integer.parseInt(request.getParameter("id"));
				usuarioDAO.eliminar(idEliminar);
				response.sendRedirect(request.getContextPath() + "/admin/usuarios");
				break;

			default:
				response.sendRedirect(request.getContextPath() + "/admin/usuarios");
			}

		} catch (SQLException e) {
			throw new ServletException("Error en base de datos", e);
		}
	}
}
