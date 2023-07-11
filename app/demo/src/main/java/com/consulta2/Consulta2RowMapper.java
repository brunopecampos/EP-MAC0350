package com.consulta2;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consulta2RowMapper implements RowMapper<Consulta2> {
    @Override
    public Consulta2 mapRow(ResultSet rs, int rowNum) throws SQLException {
        Consulta2 consulta = new Consulta2();
        consulta.setPerfil(rs.getString("tipo_perfil"));
        consulta.setNumServicos(rs.getInt("total_servicos"));
        return consulta;
    }
}