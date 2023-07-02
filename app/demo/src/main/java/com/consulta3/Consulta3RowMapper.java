package com.consulta3;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consulta3RowMapper implements RowMapper<Consulta3> {
    @Override
    public Consulta3 mapRow(ResultSet rs, int rowNum) throws SQLException {
        Consulta3 consulta = new Consulta3();
        consulta.setPerfil(rs.getString("pnome"));
        consulta.setServico(rs.getString("snome"));
        return consulta;
    }
}