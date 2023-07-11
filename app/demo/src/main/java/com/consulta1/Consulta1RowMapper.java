package com.consulta1;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consulta1RowMapper implements RowMapper<Consulta1> {
    @Override
    public Consulta1 mapRow(ResultSet rs, int rowNum) throws SQLException {
        Consulta1 consulta = new Consulta1();
        consulta.setPerfil(rs.getString("perfil"));
        consulta.setServico(rs.getString("nome_servico"));
        return consulta;
    }
}