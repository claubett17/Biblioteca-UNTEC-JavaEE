package com.untec.biblioteca.servlet;

import com.untec.biblioteca.dao.LibroDAO;
import com.untec.biblioteca.dao.PrestamoDAO;
import com.untec.biblioteca.model.Libro;
import com.untec.biblioteca.model.Prestamo;
import com.untec.biblioteca.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/admin/historial")
public class AdminPrestamoServlet extends HttpServlet {

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
        if (accion == null) accion = "listar";

        PrestamoDAO prestamoDAO = new PrestamoDAO();

        try {
            
            prestamoDAO.actualizarAtrasados();

            switch (accion) {

                case "listar":
                    List<Prestamo> prestamos = prestamoDAO.listarTodos();
                    request.setAttribute("prestamos", prestamos);
                    request.getRequestDispatcher("/views/admin/historial.jsp").forward(request, response);
                    break;

                case "devolver":
                    
                    int idPrestamo = Integer.parseInt(request.getParameter("id"));
                    
                    Prestamo prestamoA = prestamoDAO.buscarPorId(idPrestamo);

                    if (prestamoA != null) {
                        
                        prestamoDAO.devolver(idPrestamo, prestamoA.getIdLibro(), LocalDate.now().toString());
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/historial?exito=devuelto");
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/admin/historial");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error en base de datos del Administrador", e);
        }
    }
}