package com.untec.biblioteca.dao;

import com.untec.biblioteca.model.Prestamo;
import com.untec.biblioteca.util.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PrestamoDAO {

    
    public List<Prestamo> listarTodos() throws SQLException {
        List<Prestamo> prestamos = new ArrayList<>();
        
        String sql = "SELECT p.*, u.nombre AS nombre_usuario_db, l.titulo AS titulo_libro_db " + 
                     "FROM Prestamos p " +
                     "LEFT JOIN Usuarios u ON p.idUsuario = u.idUsuario " + 
                     "LEFT JOIN Libros l ON p.idLibro = l.idLibro " +
                     "ORDER BY p.idPrestamo DESC";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Prestamo p = new Prestamo();
                
                // Mapeo manual de campos básicos
                p.setIdPrestamo(rs.getInt("idPrestamo"));
                p.setIdUsuario(rs.getInt("idUsuario"));
                p.setIdLibro(rs.getInt("idLibro"));
                p.setFechaPrestamo(rs.getString("fechaPrestamo"));
                p.setFechaLimite(rs.getString("fechaLimite"));
                p.setFechaDevolucion(rs.getString("fechaDevolucion"));
                p.setEstado(rs.getString("estado"));
                
                // ASIGNACIÓN CRÍTICA: Aquí es donde traemos los nombres de las otras tablas
                p.setNombreUsuario(rs.getString("nombre_usuario_db"));
                p.setTituloLibro(rs.getString("titulo_libro_db"));
                
                prestamos.add(p);
            }
        }
        return prestamos;
    }

    
    public List<Prestamo> listarPorUsuario(int idUsuario) throws SQLException {
        List<Prestamo> prestamos = new ArrayList<>();
        String sql = "SELECT p.*, l.titulo AS titulo_libro_db " + 
                     "FROM Prestamos p " + 
                     "JOIN Libros l ON p.idLibro = l.idLibro " + 
                     "WHERE p.idUsuario = ? ORDER BY p.fechaPrestamo DESC";

        try (Connection conn = ConexionDB.getConexion(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Prestamo p = new Prestamo();
                    p.setIdPrestamo(rs.getInt("idPrestamo"));
                    p.setIdUsuario(rs.getInt("idUsuario"));
                    p.setIdLibro(rs.getInt("idLibro"));
                    p.setFechaPrestamo(rs.getString("fechaPrestamo"));
                    p.setFechaLimite(rs.getString("fechaLimite"));
                    p.setFechaDevolucion(rs.getString("fechaDevolucion"));
                    p.setEstado(rs.getString("estado"));
                    p.setTituloLibro(rs.getString("titulo_libro_db"));
                    
                    prestamos.add(p);
                }
            }
        }
        return prestamos;
    }

    
    public void insertar(Prestamo prestamo) throws SQLException {
        String sql = "INSERT INTO Prestamos (idUsuario, idLibro, fechaPrestamo, fechaLimite, estado) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.getConexion(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, prestamo.getIdUsuario());
            ps.setInt(2, prestamo.getIdLibro());
            ps.setString(3, prestamo.getFechaPrestamo());
            ps.setString(4, prestamo.getFechaLimite());
            ps.setString(5, prestamo.getEstado());

            ps.executeUpdate();
        }
    }

    
    public void devolver(int idPrestamo, int idLibro, String fechaDevolucion) throws SQLException {
        String sqlPrestamo = "UPDATE Prestamos SET fechaDevolucion = ?, estado = 'DEVUELTO' WHERE idPrestamo = ?";
        String sqlLibro = "UPDATE Libros SET disponible = 1 WHERE idLibro = ?";

        try (Connection conn = ConexionDB.getConexion()) {
            conn.setAutoCommit(false); 
            
            try (PreparedStatement psP = conn.prepareStatement(sqlPrestamo);
                 PreparedStatement psL = conn.prepareStatement(sqlLibro)) {
                
                psP.setString(1, fechaDevolucion);
                psP.setInt(2, idPrestamo);
                psP.executeUpdate();
                
                psL.setInt(1, idLibro);
                psL.executeUpdate();
                
                conn.commit(); 
            } catch (SQLException e) {
                conn.rollback(); 
                throw e;
            }
        }
    }

    
    public void actualizarAtrasados() throws SQLException {
        String sql = "UPDATE Prestamos SET estado = 'ATRASADO' "
                + "WHERE estado = 'ACTIVO' AND fechaLimite < CURDATE()";
        try (Connection conn = ConexionDB.getConexion(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.executeUpdate();
        }
    }

    
    public Prestamo buscarPorId(int id) throws SQLException {
        String sql = "SELECT p.*, l.titulo AS titulo_libro_db FROM Prestamos p " +
                     "LEFT JOIN Libros l ON p.idLibro = l.idLibro WHERE p.idPrestamo = ?";
        
        try (Connection conn = ConexionDB.getConexion(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Prestamo p = new Prestamo();
                    p.setIdPrestamo(rs.getInt("idPrestamo"));
                    p.setIdLibro(rs.getInt("idLibro"));
                    p.setTituloLibro(rs.getString("titulo_libro_db"));
                    return p;
                }
            }
        }
        return null;
    }

    
    public int contarActivos() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Prestamos WHERE estado = 'ACTIVO'";
        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }

    public int contarAtrasados() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Prestamos WHERE estado = 'ATRASADO'";
        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }
}