package com.consulta4;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consulta4RowMapper implements RowMapper<Consulta4> {
    @Override
    public Consulta4 mapRow(ResultSet rs, int rowNum) throws SQLException {
        Consulta4 consulta = new Consulta4();
        consulta.setPerfil(rs.getString("pnome"));
        consulta.setServico(rs.getString("snome"));
        return consulta;
    }
}